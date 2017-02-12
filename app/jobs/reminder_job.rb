class ReminderJob < ApplicationJob
  queue_as :default
  # after_enqueue :add_event_id

  # def add_event_id
  #   p "**" * 50
  #   p "completed"
  #   p self
  #   p "**" * 50
  # end 


  after_enqueue do |job|
    p Delayed::Job.last.handler
  end

  def perform(event)   
    @event = event
    if @event 
      p "**" * 50
      p @event
      p "**" * 50
      @name = @event.user.first_name
      @phone_number = @event.user.phone_number
      @date = @event.sat.date.to_s
      @location = @event.sat.location_name
      @address = @event.sat.address

      account_sid = ENV["ACCOUNT_KEY"] 
      auth_token = ENV["SECRET_KEY"]
      @client = Twilio::REST::Client.new account_sid, auth_token 
      message = @client.account.messages.create(
        :from => "+14152003527",
        :to => @phone_number,
        :body => "Hi #{@name}, you have an SAT test coming up on #{@date} at #{@location}: #{@address}",
      )
    else 
      p "**" * 50
      p "This event was cancelled"
      p "**" * 50
    end 
  end
end
