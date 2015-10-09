require 'minitest_helper'

# MediumSpec is used to test the main Medium SDK Client
module MediumSpec
  describe 'Medium Client', 'The Medium SDK Gem Client' do
    before do
      auth = { integration_token: ENV['integration_token'] }
      @client = Medium::Client.new auth
    end

    it 'should initialize the correct type of client object' do
      expect(@client).must_be_instance_of Medium::Client
    end

    it 'should create a users sub-client' do
      expect(@client.users).must_be_instance_of Medium::Users
    end
  end
end
