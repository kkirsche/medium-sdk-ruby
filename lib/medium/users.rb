# Medium is a module used to interact with the Medium v1 API
module Medium
  # Users class is used to interact with the Users API endpoint of Medium
  class Users
    def initialize(client)
      @client = client
    end

    def me
      response = @client.get 'me'
      Medium::Client.validate response
    end
  end
end
