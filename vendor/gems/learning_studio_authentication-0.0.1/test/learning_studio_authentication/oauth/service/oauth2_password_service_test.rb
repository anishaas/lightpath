require File.expand_path("../../../../test_helper", __FILE__)
require File.expand_path("../oauth_test_helper", __FILE__)
require File.expand_path("../oauth2_test_helper", __FILE__)
require 'learning_studio_authentication/service/oauth2_password_service'
require "learning_studio_authentication/util"

module LearningStudioAuthentication
  module Service
    class OAuth2PasswordServiceTest < MiniTest::Unit::TestCase
      include OAuthTestHelper
      include OAuth2TestHelper

      def setup
        @oauth_config = FactoryGirl.build(:oauth_config)
        @test_constants = FactoryGirl.build(:test_constant)
        @service = LearningStudioAuthentication::Service::OAuth2PasswordService.new(@oauth_config)
      end

      def test_generate_request
        request = @service.generate_request(@test_constants.teacher_username, @test_constants.teacher_password)
        verify_request(request)
        get(@test_constants.url, request.headers)
      end

      def test_refresh_token_request_with_valid_token
        request = @service.generate_request(@test_constants.teacher_username, @test_constants.teacher_password)
        access_token = request.access_token
        refresh_token = request.refresh_token
        expires_at = request.expires_at
        sleep(3)
        request = @service.refresh_token_request(request)
        refute access_token == request.access_token, "Access token should be different when not expired"
        refute refresh_token == request.refresh_token, "Refresh token should be different when not expired"
        assert expires_at < request.expires_at, "Refresh token should be the same or in the future"
        verify_request(request)
        get(@test_constants.url, request.headers)
      end

      private
      def verify_request(request)
        refute_nil request.refresh_token, "Refresh token should not be null"
        super
      end
    end
  end
end
