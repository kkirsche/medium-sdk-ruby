# Medium is a module used to interact with the Medium v1 API
module Medium
  # Users class is used to interact with the Users API endpoint of Medium
  class Users
    def initialize(client)
      @client = client
    end

    def me
      response = @client.get 'me'
      validate response
    end

    private

    def validate(response)
      if response.success?
        JSON.parse response.body
      else
        fail "Failed with #{response.status_type} error from server. Received error #{response.status_code}."
      end
    end
  end
end
