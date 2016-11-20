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
  
  def get_mentor_availability(mentor_id)
    response = self.class.get(bloc_api_url("mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
    @mentor_availability = JSON.parse(response.body)
  end
  
  def get_roadmap(roadmap_id)
    response = self.class.get(bloc_api_url("roadmaps/#{roadmap_id}"), headers: {"authorization" => @auth_token})
    @roadmap = JSON.parse(response.body)
  end
  
  def get_checkpoint(checkpoint_id)
    response = self.class.get(bloc_api_url("checkpoints/#{checkpoint_id}"), headers: { "authorization" => @auth_token })
    @checkpoint = JSON.parse(response.body)
  end
  
  def get_messages(page)
    response = self.class.get(bloc_api_url("message_threads?page=#{page}"), headers: { "authorization" => @auth_token })
    @messages = JSON.parse(response.body)
  end
  
  def create_message(sender_email, recipient_id, subject, message)
    response = self.class.post(bloc_api_url("messages"), body: {"sender": sender_email, "recipient_id": recipient_id, "subject": subject, "stripped-text": message}, headers: {"authorization" => @auth_token })
    puts response
  end
  
  
  private
  #stores url
  def bloc_api_url(end_point)
    "https://www.bloc.io/api/v1/#{end_point}"
  end
  
  
  
end