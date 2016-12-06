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
    #       "id": "123456789exampleid",
    #       "username": "kkirsche",
    #       "name": "Kevin Kirsche",
    #       "url": "https://medium.com/@kkirsche",
    #       "imageUrl": "https://images.medium.com/somewhere.png"
    #     }
    #   }
    #   ```
    def me
      response = @client.get 'me'
      Medium::Client.validate response
    end

    # Returns an array of a user's publications.
    #
    # @param user [User] A user object.
    #
    # @return [Array] The response is an array of Publication objects within a data envelope.
    #   Example response:
    #   ```
    #   HTTP/1.1 200 OK
    #   Content-Type: application/json; charset=utf-8
    #   {
    #     "data": {
    #       "id": "123456789exampleid",
    #       "name": "Awesome Publication",
    #       "description": "My amazing publication",
    #       "url": "https://medium.com/awesome-publication",
    #       "imageUrl": "https://images.medium.com/somewhere.png"
    #     }
    #   }
    #   ```
    def publications(user)
      response = @client.get "users/#{user['data']['id']}/publications"
      Medium::Client.validate response
    end
  end
end
