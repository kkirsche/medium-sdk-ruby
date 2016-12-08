# Medium is a module used to interact with the Medium v1 API
module Medium
  # The Client class is used to interact with the resources the Medium API
  # exposes.
  class Client
    # :users is the User resource sub-client
    # :posts is the Post resource sub-client
    attr_reader :users, :posts

    # Creates a new instance of Medium::Client.
    #
    # @param auth_creds [Hash] The credentials to use for authentication with
    #   the Medium API. This can be a self provided :integration_token. OAuth
    #   support to be added in the future.
    def initialize(auth_creds)
      @client = Hurley::Client.new 'https://api.medium.com/v1/'
      @client.connection = Hurley::HttpCache.new
      auth_headers_with auth_creds

      true
    end

    # Create a user resource sub-client if necessary.
    #
    # @return [Medium::Users] Medium Users resource sub-client
    def users
      @users ||= Medium::Users.new @client
    end

    # Create a posts resource sub-client if necessary.
    #
    # @return [Medium::Users] Medium Users resource sub-client
    def posts
      @posts ||= Medium::Posts.new @client
    end

    # Create a publications resource sub-client if necessary.
    #
    # @return [Medium::publications] Medium Publications resource sub-client
    def publications
      @posts ||= Medium::Publications.new @client
    end

    private

    # Add authorization headers to the Hurley client. This allows us to
    # authenticate and communicate with the Medium API.
    #
    # @param creds [Hash] The credentials / key to use when authenticating with
    #   the Medium API.
    # @return [TrueClass] Returns true if the headers are set successfully.
    #   Otherwise, an error is thrown.
    def auth_headers_with(creds)
      token = creds[:integration_token] || creds['integration_token']
      @client.header[:Authorization] = "Bearer #{token}"
      true
    end

    # A class method to validate responses from the Medium API.
    #
    # @param response [#status_type and #body] The response object from the
    #   remote server. The body is the actual response from the server. The
    #   status_type exposes whether the request was successful or if it failed
    #   with an error
    # @return [Hash] Returns the response body if the request is successful.
    #   Otherwise, an error is thrown.
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
