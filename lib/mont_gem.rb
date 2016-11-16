require 'httparty'
require 'json'

class MontGem
  include HTTParty
  
  def initialize(email, password)
    response = self.class.post(bloc_api_url("sessions"), body: {"email": email, "password": password})
    puts response.code
    raise "Error" if response.code == 404
    @auth_token = response["auth_token"]
  end
  
  # headers: { "authorization" => @auth_token }
  #2.3.0 :001 > require './lib/mont_gem.rb'
  #2.3.0 :002 > MontGem.new("briansmont830@gmail.com", "football31")
  
  def get_me
    response = self.class.get(bloc_api_url("users/me"), headers: {"authorization" => @auth_token})
    @user_data = JSON.parse(response.body)
  end
  
  private
  #stores url
  def bloc_api_url(end_point)
    "https://www.bloc.io/api/v1/#{end_point}"
  end
  
  
  
end