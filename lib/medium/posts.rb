module Medium
  class Posts
    def initialize(client)
      @client = client
    end

    def create(opts)
      @client.post "users/#{@client.users.me['data']['id']}/posts",
                   build_request_with(opts)
    end

    private

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
