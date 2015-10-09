require 'minitest_helper'

# MediumSpec is used to test the main Medium SDK Client
module MediumSpec
  describe 'Medium Client', 'The Medium SDK Gem Client' do
    before do
      auth = { integration_token: ENV['integration_token'] }
      @client = Medium::Client.new auth
      @users_client = @client.users
    end

    it 'should initialize the correct type of client object' do
      expect(@users_client.me).must_equal {}
    end
  end
end
