# Medium is a module used to interact with the Medium v1 API
module Medium
  class Client
    attr_reader :users

    def initialize(auth_creds)
      @client = Hurley::Client.new 'https://api.medium.com/v1/'
      @client.connection = Hurley::HttpCache.new
      @client.header[:Authorization] = "Bearer #{auth_creds[:integration_token]}"
    end

    def users
      @users ||= Medium::Users.new @client
    end
  end
end
