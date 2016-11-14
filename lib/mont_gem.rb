require 'httparty'

class MontGem
  include HTTParty
  
  def initialize(email, password)
    response = self.class.post(storage("sessions"), body: {"email": email, "password": password})
    puts response.code
    raise "Error" if response.code == 404
    @auth_token = response["auth_token"]
  end
  
  
  private
  def storage(end_point)
    "https://www.bloc.io/api/v1/#{end_point}"
  end
  
end