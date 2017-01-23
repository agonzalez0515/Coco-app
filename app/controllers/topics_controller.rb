class TopicsController < ApplicationController

  protect_from_forgery except: :search

  def show
    @user = current_user
    @messages = Message.where(topic_id: params[:id])
    @topics = Topic.all
    @topic_id = params[:id]
  end
end
