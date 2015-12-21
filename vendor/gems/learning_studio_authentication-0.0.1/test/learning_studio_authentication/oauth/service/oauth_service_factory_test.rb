require File.expand_path("../../../../test_helper", __FILE__)
require 'learning_studio_authentication/service/oauth_service_factory'
module LearningStudioAuthentication
  module Service
    class OAuthServiceFactoryTest < MiniTest::Unit::TestCase
      def setup
        @oauth_config = FactoryGirl.build(:oauth_config)
        @factory = LearningStudioAuthentication::Service::OAuthServiceFactory.new(@oauth_config)
      end

      def test_build_with_invalid_class
        assert_raises(NotImplementedError) { @factory.build("InvalidOAuthService") }
      end

      def test_build_with_nil
        assert_raises(NotImplementedError) { @factory.build(nil) }
      end

      def test_build_with_valid_class
        @subject = @factory.build("OAuth1SignatureService")
        assert_kind_of LearningStudioAuthentication::Service::OAuth1SignatureService, @subject
      end
    end
  end
end
