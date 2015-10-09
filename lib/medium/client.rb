# Medium is a module used to interact with the Medium v1 API
module Medium
  class Client
    attr_reader :users, :posts

    # Creates a new instance of Medium::Client.
    def initialize(auth_creds)
      @client = Hurley::Client.new 'https://api.medium.com/v1/'
      @client.connection = Hurley::HttpCache.new
      auth_headers_with auth_creds

      true
    end

    def users
      @users ||= Medium::Users.new @client
    end

    def posts
      @posts ||= Medium::Posts.new @client
    end

    private

    def auth_headers_with(creds)
      token = creds[:integration_token] || creds['integration_token']
      @client.header[:Authorization] = "Bearer #{token}"
    end

    def self.validate(response)
      response_body = JSON.parse response.body
      if response.success?
        response_body
      else
        fail "Failed with #{response.status_type} error from server. Received error: #{response_body['errors'][0]['message']}"
      end
    end
  end
end
