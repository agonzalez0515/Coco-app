class EventsController < ApplicationController
  before_action :get_user
  before_action :set_event, only: [:index, :create, :show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @events = @user.events
  end

  def new
    @user = User.new
    @event = Event.new
    @dates = Sat.pluck(:date).uniq
  end

  def create
    @sat = Sat.find(params[:sat_id])
    @event = Event.new(user_id: @user.id, sat_id: @sat.id, completed: false)

    if @event.save

      event_information = {
        name: @sat.location_name
      }

      redirect_to user_events_path
      # ReminderJob.new.delay(run_at: 1.minute.from_now).perform(event_information)
      ReminderJob.new.delay.perform(event_information)

    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @sat_lat = @event.sat.latitude
    @sat_long = @event.sat.longitude
    # respond_to do |format|
    #   format.js { render json: {event_id: @event.id, user_id: current_user.id, sats: @event, lat: @sat_lat, long: @sat_long} }
    #   format.html {render :index}
    # end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @sat = Sat.where(location_name: params[:location_name], date: params[:date]).first
    @event = Event.find(params[:id])

    if @event.update(event_params)
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

  def get_user
    if !current_user
      redirect_to root_path
    end
  end

  def event_params
      params.require(:event).permit(:user_id, :sat_id)
  end

  def set_event
    @user = User.find(params[:user_id])
  end

end
