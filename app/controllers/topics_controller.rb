class TopicsController < ApplicationController

  protect_from_forgery except: :search
  before_action :get_user
  before_action :set_topic, only: [ :index]

  def index
    @messages = Message.where(topic_id: params[:id])
  end
