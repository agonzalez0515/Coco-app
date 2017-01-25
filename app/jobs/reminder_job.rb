class ReminderJob < ApplicationJob
  queue_as :default
  after_enqueue :add_event_id

  def add_event_id
    # @event = Event.where(user_id: params[:user_id], sat_id: params[:sat_id])
    p "**" * 50 
    p @event
    p Delayed::Job.find(self.provider_job_id)
    p "**" * 50
  end 

  def perform(event)
    @event = event
    self.event_id = @event.id
    @name = @event.user.first_name
    @phone_number = @event.user.phone_number
    @date = @event.sat.date.to_s
    @location = @event.sat.location_name
    @address = @event.sat.address
    account_sid = ENV["ACCOUNT_KEY"] 
    auth_token = ENV["SECRET_KEY"]
    @client = Twilio::REST::Client.new account_sid, auth_token 
    message = @client.account.messages.create(
      :from => "+14152002640",
      :to => @phone_number,
      :body => "Hi #{@name}, you have an SAT test coming up on #{@date} at #{@location}: #{@address}",
    )
  end
end
