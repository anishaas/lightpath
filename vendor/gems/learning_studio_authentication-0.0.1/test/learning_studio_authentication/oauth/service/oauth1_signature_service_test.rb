require File.expand_path("../../../../test_helper", __FILE__)
require File.expand_path("../oauth_test_helper", __FILE__)
require 'learning_studio_authentication/service/oauth1_signature_service'

module LearningStudioAuthentication
  module Service
    class OAuth1SignatureServiceTest < MiniTest::Unit::TestCase
      include OAuthTestHelper

      def setup
        @oauth_config = FactoryGirl.build(:oauth_config)
        @test_constants = FactoryGirl.build(:test_constant)
        @service = LearningStudioAuthentication::Service::OAuth1SignatureService.new(@oauth_config)
      end

      def test_generate_request_with_get
        request = @service.generate_request("GET", @test_constants.url, "")
        verify_request(request)
        get(@test_constants.url, request.headers)
      end

      def test_generate_request_with_post
        request = @service.generate_request("POST", @test_constants.url, @test_constants.post_body)
        verify_request(request)
        body = post(@test_constants.url, request.headers, @test_constants.post_body)
        resource_id = body[@test_constants.resource_object_key][@test_constants.resource_id_key]
        url = "#{@test_constants.url}/#{resource_id}"
        request = @service.generate_request('DELETE', url, "")
        verify_request(request)
        headers = request.headers
        delete(url, headers, @test_constants.resorce_single)
      end

      def test_generate_request_with_put
        request = @service.generate_request("POST", @test_constants.url, @test_constants.post_body)
        verify_request(request)
        sid = nil
        begin
          body = post(@test_constants.url, request.headers, @test_constants.post_body)
          resource_id = body[@test_constants.resource_object_key][@test_constants.resource_id_key]
          url = "#{@test_constants.url}/#{resource_id}"
          body = body.to_json
          request = @service.generate_request('PUT', url, body)
          verify_request(request)
          headers = request.headers
          sleep(10)
          put(url, headers, body)
        ensure
          if resource_id !=nil
            url = "#{@test_constants.url}/#{resource_id}"
            request = @service.generate_request('DELETE', url, "")
            headers = request.headers
            delete(url, headers, @test_constants.resorce_single)
          end
        end
      end

      def test_generate_request_with_delete
        request = @service.generate_request("POST", @test_constants.url, @test_constants.post_body)
        body = post(@test_constants.url, request.headers, @test_constants.post_body)
        resource_id = body[@test_constants.resource_object_key][@test_constants.resource_id_key]
        url = "#{@test_constants.url}/#{resource_id}"
        request = @service.generate_request('DELETE', url, "")
        verify_request(request)
        headers = request.headers
        delete(url, headers, @test_constants.resorce_single)
      end

      private
      def verify_request(request)
        refute_nil request, "request should not be nil"
        refute_nil request.signature, "request should have a signature"
        refute_nil request.headers, "request should have a header"
        assert_equal request.headers.length, 1, "request should have only one header"
      end
    end
  end
end
