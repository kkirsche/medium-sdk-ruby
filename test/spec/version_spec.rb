require 'minitest_helper'

# BarkSpec is used to test the main client class
module MediumSpec
  describe 'Medium Client', 'The Medium API Client Class' do
    before do
      @auth = { integration_token: ENV['integration_token'] }
    end

    it 'should initialize the correct type of client object' do
      client = Medium::Client.new @auth
      expect(client).must_be_instance_of Medium::Client
    end

    it 'should have a version number' do
      expect(Medium::VERSION).wont_be_nil
    end
  end
end
