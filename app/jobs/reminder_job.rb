class ReminderJob < ApplicationJob
  queue_as :default

  def perform(args = {})
    @name = args[:name]
    @phone_number = args[:phone_number]
    @date = args[:date]
    @location = args[:location]
    @address = args[:address]
    p "********" * 50
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
