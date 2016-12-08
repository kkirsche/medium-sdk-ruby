module Medium
  class Publications

    # Initialize a new Medium::Publications client
    #
    # @param client [#get] The network client to use while retrieving data from
    #   the Publications resource.
    # @return [Medium::Publications] Returns a Medium::Publications instance
    def initialize(client)
      @client = client
    end

    # Retrieves a list of contributers for a give publication
    #
    # @param publication [Publication] A publication object.
    # @return [Array] The response is an array of contributers with a data envelope.
    #  Example response:
    #  ```
    #  HTTP/1.1 200 OK
    #  Content-Type: application/json; charset=utf-8
    #  {
    #    "data": [
    #      {
    #        "publicationId"=>"e4ef2f080bc",
    #        "userId"=>"1f333db49fd61858ff96c2a0676298b1d2fa44f30ad40209b09245d2c1fcf298b",
    #        "role"=>"editor"
    #      }
    #    ]
    #  }
    #  ```
    def contributers(publication)
      response = @client.get "publications/#{publication['id']}/contributors"
      Medium::Client.validate response
    end

    # Creates a post in a publication on behalf of the authenticated user.
    #
    # @param publication [Publication] A publication object.
    # @param opts [Hash] A hash of options to use when creating a post. The opts
    #   hash requires the keys: `:title`, `:content_format`, and `:content`. The
    #   following keys are optional: `:tags`, `:canonical_url`,
    #   `:publish_status`, and `:license`
    # @return [Hash] The response is a Post object within a data envelope.
    #   Example response:
    #   ```
    #   HTTP/1.1 201 OK
    #   Content-Type: application/json; charset=utf-8
    #   {
    #     "data": {
    #       "id": "e6f36a",
    #       "title": "Liverpool FC",
    #       "authorId": "5303d74c64f66366f00cb9b2a94f3251bf5",
    #       "tags": ["football", "sport", "Liverpool"],
    #       "url": "https://medium.com/@majelbstoat/liverpool-fc-e6f36a",
    #       "canonicalUrl": "http://jamietalbot.com/posts/liverpool-fc",
    #       "publishStatus": "public",
    #       "publishedAt": 1442286338435,
    #       "license": "all-rights-reserved",
    #       "licenseUrl": "https://medium.com/policy/9db0094a1e0f",
    #       "publicationId": "e3ef7f020bd"
    #     }
    #   }
    #   ```
    def create_post(publication, opts)
      response = @client.post "publications/#{publication['id']}/posts",
                              build_request_with(opts)
      Medium::Client.validate response
    end

    private

    def build_request_with(opts)
      {}.tap do |hash|
        hash[:title] = opts[:title]
        hash[:contentFormat] = opts[:content_format]
        hash[:content] = opts[:content]
        hash[:tags] = opts[:tags]
        hash[:publishStatus] = opts[:publish_status] if opts.key?(:publish_status)
      end
    end
  end
end
