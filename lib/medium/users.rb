# Medium is a module used to interact with the Medium v1 API
module Medium
  # Users class is used to interact with the Users API endpoint of Medium
  class Users
    def initialize(client)
      @client = client
    end

    def me
      response = @client.get 'me'
      if response.success?
        JSON.parse response.body
      else
        response
      end
    end
  end
end
