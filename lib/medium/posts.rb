module Medium
  class Posts
    def initialize(client)
      @client = client
    end

    # Creates a post on the authenticated user’s profile.
    #
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
    #       "licenseUrl": "https://medium.com/policy/9db0094a1e0f"
    #     }
    #   }
    #   ```
    def create(user, opts)
      @client.post "users/#{user['data']['id']}/posts",
                   build_request_with(opts)
    end

    private

    # Takes the options provided in `Medium::Posts#create` and buildes the
    # appropriate hash of options from it.
    #
    # @param opts [Hash] A hash of options to use when creating a post. The opts
    #   hash requires the keys: `:title`, `:content_format`, and `:content`. The
    #   following keys are optional: `:tags`, `:canonical_url`,
    #   `:publish_status`, and `:license`
    # @return [Hash] The request hash
    def build_request_with(opts)
      {}.tap do |hash|
        hash[:title] = opts[:title]
        hash[:contentFormat] = opts[:content_format]
        hash[:content] = opts[:content]
        hash[:tags] = opts[:tags] if opts.key? :tags
        hash[:canonicalUrl] = opts[:canonical_url] if opts.key? :canonical_url
        hash[:publishStatus] = opts[:publish_status] if opts.key? :publish_status
        hash[:license] = opts[:license] if opts.key? :license
      end
    end
  end
end
