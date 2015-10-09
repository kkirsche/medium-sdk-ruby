# Medium is a module used to interact with the Medium v1 API
module Medium
  # Users class is used to interact with the Users API endpoint of Medium
  class Users
    # Initialize a new Medium::Users client
    #
    # @param client [#get] The network client to use while retrieving data from
    #   the Users resource.
    # @return [Medium::Users] Returns a Medium::Users instance
    def initialize(client)
      @client = client
    end

    # Returns details of the user who has granted permission to the application.
    #
    # @return [Hash] The response is a User object within a data envelope.
    #   Example response:
    #   ```
    #   HTTP/1.1 200 OK
    #   Content-Type: application/json; charset=utf-8
    #   {
    #     "data": {
    #       "id": "5303d74c64f66366f00cb9b2a94f3251bf5",
    #       "username": "majelbstoat",
    #       "name": "Jamie Talbot",
    #       "url": "https://medium.com/@majelbstoat",
    #       "imageUrl": "https://images.medium.com/0*fkfQiTzT7TlUGGyI.png"
    #     }
    #   }
    #   ```
    def me
      response = @client.get 'me'
      Medium::Client.validate response
    end
  end
end
