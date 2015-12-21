require File.expand_path("../../../../test_helper", __FILE__)
require File.expand_path("../oauth_test_helper", __FILE__)
require File.expand_path("../oauth2_test_helper", __FILE__)
require 'learning_studio_authentication/service/oauth2_assertion_service'
require "learning_studio_authentication/util"

module LearningStudioAuthentication
  module Service
    class OAuth2AssertionServiceTest < MiniTest::Unit::TestCase
      include OAuthTestHelper
      include OAuth2TestHelper

      def setup
        @oauth_config = FactoryGirl.build(:oauth_config)
        @test_constants = FactoryGirl.build(:test_constant)
        @service = LearningStudioAuthentication::Service::OAuth2AssertionService.new(@oauth_config)
      end

      def test_generate_request
        request = @service.generate_request(@test_constants.teacher_username)
        verify_request(request)
        get(@test_constants.url, request.headers)
      end

      private
      def verify_request(request)
        assert_nil request.refresh_token, "Refresh token should be null"
        super
      end
    end
  end
end
