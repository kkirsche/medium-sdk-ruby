require 'minitest_helper'

# MediumSpec is used to test the main Medium SDK Client
module MediumSpec
  describe 'Medium Publications Client', 'The Medium SDK Gem Posts Resource Client' do
    before do
      auth = { integration_token: ENV['integration_token'] }
      @client = Medium::Client.new auth
      @publications_client = @client.publications
      @users_client = Medium::Client.new(auth).users
    end

    it 'should initialize the correct type of client object' do
      expect(@publications_client).must_be_instance_of Medium::Publications
    end

    it 'should return a list of contributers for a publication' do
      response = {
        'data'=> [{
          'publicationId' => 'a3ed2f08643',
          'userId' => '1008821ef02b8f33ad7b7c8c8c0a3153d2f954e292771b61c4769522a5097eaac',
          'role' => 'editor'
        }]
      }
      VCR.use_cassette('publication_contributers') do
        publication = @users_client.publications['data'].first
        expect(@publications_client.contributers(publication)).must_equal response
      end
    end
  end
end
