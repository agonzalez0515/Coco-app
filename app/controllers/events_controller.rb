class EventsController < ApplicationController
  before_action :get_user
  before_action :set_event, only: [:index, :create, :show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @events = @user.events
  end

  def new
    @event = Event.new
    @dates = Sat.pluck(:date).uniq
  end

  def create
    @sat = Sat.find(params[:sat_id])
    @event = Event.new(user_id: @user.id, sat_id: @sat.id, completed: false)

    @all_dates = []

    @user.sats.each do |sat|
      @all_dates.push(sat.date)
    end

    if @all_dates.include?(@sat.date)
       redirect_to new_user_event_path
    else 
      @event.save
      redirect_to user_events_path
      ReminderJob.new.delay(run_at: @sat.date - 5).perform(@event)
    # code for testing reminder (replace line 30 with line 32): 
      # ReminderJob.new.delay(run_at: 1.minute.from_now).perform(@event)
    end
  end

  def show
    @event = Event.find(params[:id])
    @sat_lat = @event.sat.latitude
    @sat_long = @event.sat.longitude

  end

  def edit
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to new_user_event_path
  end

  def update
    @sat = Sat.where(location_name: params[:location_name], date: params[:date]).first
    @event = Event.find(params[:id])

    if @event.update(event_params)
      ReminderJob.new.delay(run_at: @sat.date - 5).perform(@event)
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