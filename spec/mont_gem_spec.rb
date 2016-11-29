require 'spec_helper'

describe MontGem, type: :request do
  
  describe '#initialize' do
    it 'authenticates the user', vcr: {cassette_name: :initialize} do
      mont = MontGem.new(ENV['EMAIL'], ENV['PASSWORD'])
      expect(mont.instance_variable_get(:@auth_token)).to be_a String
    end
  end
  
  describe '#get_me' do
    it 'confirms the method returns an object', vcr: {cassette_name: :get_me} do
      mont = MontGem.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = mont.get_me
      expect(response.instance_variable_get(:@user_data)).to be_a Object
    end
  end
  
  describe '#get_roadmap' do
    it 'confirms the method returns an object', vcr: {cassette_name: :get_roadmap} do
      mont = MontGem.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = mont.get_roadmap(ENV['ROADMAP_ID'])
      expect(response.instance_variable_get(:@roadmap)).to be_a Object
    end
  end
  
  describe 'get_checkpoint' do
    it 'confirms the method returns an object', vcr: {cassette_name: :get_checkpoint} do
      mont = MontGem.new(ENV['EMAIL'], ENV['PASSWORD'])
      response = mont.get_checkpoint(ENV['CHECKPOINT_ID'])
      expect(response.instance_variable_get(:@checkpoint)).to be_a Object
    end
  end
  
  
  
end