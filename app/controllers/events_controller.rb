class EventsController < ApplicationController
  before_action :set_event, only: [:index, :create, :show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @events = @user.events
    p 
    p params
    respond_to do |format|
      format.html
      format.json {render json: @events.to_json}
    end
  end


  def new
    @event = Event.new
    @dates = Sat.pluck(:date).uniq
  end

  def create
    @sat = Sat.where(location_name: params[:location_name], date: params[:date]).first
    @event = Event.new(user_id: @user.id, sat_id: @sat.id, completed: false)

    if @event.save
      event_information = {
        name: @user.first_name,
        phone_number: @user.phone_number,
        date: @sat.date.to_s,
        location: @sat.location_name
            }

      ReminderJob.set(wait: 1.minute).perform_later(event_information)
      ReminderJob.set(wait: 3.minutes).perform_later(event_information)

      redirect_to user_events_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @sat = Sat.where(location_name: params[:location_name], date: params[:date]).first
    @event = Event.find(params[:id])

    if @event.update(event_params)
      event_information = {
        name: @user.first_name,
        phone_number: @user.phone_number,
        date: @sat.date.to_s,
        location: @sat.location_name
            }

      ReminderJob.set(wait: 1.minute).perform_later(event_information)
      ReminderJob.set(wait: 3.minutes).perform_later(event_information)

      redirect_to user_event_path
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_events_path
  end

private
  # def set_event
  #   @event = Event.find(params[:id])
  # end
  def event_params
      params.require(:event).permit(:user_id, :sat_id)
  end

  def set_event
    @user = User.find(params[:user_id])
  end

end

# date: "2017-06-03"
# location_name: "YUCAIPA HS"

    # p '*******' * 20
    # p @user.id
    # p '*******' * 20
