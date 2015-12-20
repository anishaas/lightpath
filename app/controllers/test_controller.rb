class API_test
  def initialize
    @applicationName = "progressTracker" 
    @keyMoniker = "myKeyMoniker"
    @applicationId = "myApplicationId"
    @clientString = "myString"
    @userName = "ptrackstudent"
    # date & time when the token request was signed (in UTC).
    @timestamp = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%S.%LZ")
    # Reformatted timestamp (changes are required to get an access token)
    @signatureDateTime = Date.parse("#{@timestamp}").strftime("%Y-%m-%dT%H%3a%M%3a%3aSZ")
    @assertion = "#{@applicationName}|#{@keyMoniker}|#{@applicationId}|#{@clientString}|#{@userName}|#{@timestamp}"
    # creating assertion signature and appending it to the assertion
    key = OpenSSL::Random.random_bytes(16)
    cmac = CMAC.new(key)
    signature = cmac.sign(@assertion)
    @assertionSignature = Digest::SHA2.hexdigest(signature)
    @assertion << "|#{@assertionSignature}"
  end

  def request_token
    base_uri = "https://api.learningstudio.com"
    # API Routes/Parameters
    api_route = "/token"
    # Request Header
    contentType = "application/x-www-form-urlencoded"
    # Request Body
    grant_type="#{@assertion}&assertion_type=urn%3aecollege%3anames%3amoauth%3a1.0%3aassertion&assertion=#{@applicationName}%7c#{@keyMoniker}%7c#{@applicationId}%7c#{@clientString}%7c#{@userName}%7c#{@signatureDateTime}%7c#{@assertionSignature}"
    response = HTTParty.post(base_uri + api_route, :headers => {"Content-Type" => contentType}, :body => grant_type)
    puts response
  end
end

test1 = API_test.new
test1.request_token
