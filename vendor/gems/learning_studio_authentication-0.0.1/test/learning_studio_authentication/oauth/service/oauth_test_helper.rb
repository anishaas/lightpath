require 'httpclient'

module LearningStudioAuthentication
  module Service
    module OAuthTestHelper
      def connection
        @connection ||= HTTPClient.new
      end

      def get(url, headers)
        request("GET", url, headers)
      end

      def post(url, headers, body)
        request("POST", url, headers, body)
      end

      def put(url, headers, body)
        request("PUT", url, headers, body)
      end

      def delete(url, headers, json_check=false)
        request("DELETE", url, headers, nil, json_check)
      end

      def request(method, url, headers, body=nil, json_check=nil)
        #TODO: Change this to deep copy, for now this is fine
        req_headers = headers.clone
        data = nil

        if ["POST", "PUT"].include?(method.upcase)
          unless body.nil?
            req_headers['Content-Type'] = 'application/json'
            data = body.encode('utf-8')
            req_headers['Content-Length'] = data.length
          end
        end

        response =  connection.request(method, url, nil, data, req_headers)
        code = response.code

        assert [200, 201, 204].include?(code), "Unexpected response code #{code} for #{method} on #{url}"
        resp = response.body

        if !resp.nil? && resp.length > 0
          json_data = JSON.parse(resp)
        end

        if method.upcase == "DELETE" && code != 204
          refute_empty json_data[json_check], "#{json_check} property not found in JSON response: #{json_data}"
        end

        json_data
      end
    end
  end
end
