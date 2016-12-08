require 'minitest_helper'

# MediumSpec is used to test the main Medium SDK Client
module MediumSpec
  describe 'Medium Publications Client', 'The Medium SDK Gem Posts Resource Client' do
    before do
      auth = { integration_token: ENV['integration_token'] }
      @client = Medium::Client.new auth
      @publications_client = @client.publications
    end

    it 'should initialize the correct type of client object' do
      expect(@publications_client).must_be_instance_of Medium::Publications
    end

    describe 'api requests' do

      before do
        @publication = VCR.use_cassette('publication') do
          @client.users.publications['data'].first
        end
      end

      it 'should return a list of contributers for a publication' do
        response = {
          'data' => [{
            'publicationId' => 'a3ed2f08643',
            'userId' => '1008821ef02b8f33ad7b7c8c8c0a3153d2f954e292771b61c4769522a5097eaac',
            'role' => 'editor'
          }]
        }
        VCR.use_cassette('publication_contributers') do
          expect(@publications_client.contributers(@publication)).must_equal response
        end
      end

      it 'should post a story to a publication' do
        VCR.use_cassette('publish_publication_post') do
          results = @publications_client.create_post(
            @publication,
            title: 'Test Title',
            content_format: 'html',
            content: '<h1>Title</h1><p>This is a test</p>',
            tags: %w(Testing),
            publish_status: 'draft'
          )
          expect(results['data']['url']).must_equal 'https://medium.com/@kkirsche/727b71df8212'
          expect(results['data']['publicationId']).must_equal @publication['id']
          expect(results['data']['title']).must_equal 'Test Title'
        end
      end
    end
  end
end
