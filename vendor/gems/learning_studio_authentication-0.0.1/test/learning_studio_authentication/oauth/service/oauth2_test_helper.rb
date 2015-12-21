module LearningStudioAuthentication
  module Service
    module OAuth2TestHelper
      private
      def verify_request(request)
        refute_nil request, "Request should not be nil"
        refute_nil request.access_token, 'Access Token should not be nil'
        refute_nil request.headers, "Headers should exist"
        assert_equal request.headers.length, 1, "Headers should contain a single header"
        refute_nil request.expires_in_seconds, "Expire time should not be null"
        assert request.expires_in_seconds > 0, "Expire time should be greater than 0"

        current_time = LearningStudioAuthentication::Util::current_time_millis
        refute_nil request.creation_time, "Created Time should not be null"
        assert current_time >= request.creation_time, "Token creation should have occurred in the past"
        refute_nil request.expires_in_seconds, "Expiration time should exist"

        assert current_time < request.expires_at, "Token expiration should occur in the future"
        assert request.expires_at - request.creation_time == (request.expires_in_seconds * 1000),
          "Diff in creation and expiration time should match expiresInSeconds"
      end
    end
  end
end
