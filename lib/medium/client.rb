# Medium is a module used to interact with the Medium v1 API
module Medium
  class Client
    attr_reader :users

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

    private

    def auth_headers_with(creds)
      token = creds[:integration_token] || creds['integration_token']
      @client.header[:Authorization] = "Bearer #{token}"
    end
  end
end
