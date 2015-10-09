require 'minitest_helper'

# MediumSpec is used to test the main Medium SDK Client
module MediumSpec
  describe 'Medium Posts Client', 'The Medium SDK Gem Posts Resource Client' do
    before do
      auth = { integration_token: ENV['integration_token'] }
      @client = Medium::Client.new auth
      @posts_client = @client.posts
    end

    it 'should initialize the correct type of client object' do
      expect(@posts_client).must_be_instance_of Medium::Posts
    end
  end
end

