require 'minitest_helper'

# MediumSpec is used to test the main Medium SDK Client
module MediumSpec
  describe 'Medium Constants', 'The Medium SDK Gem Version' do
    it 'should have a version number' do
      expect(Medium::VERSION).wont_be_nil
    end
  end
end
