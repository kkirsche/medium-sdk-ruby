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
      response_body = JSON.parse response.body
      if response.success?
        response_body
      else
        fail "Failed with #{response.status_type} error from server. Received error: #{response_body['errors'][0]['message']}"
      end
    end
  end
end
