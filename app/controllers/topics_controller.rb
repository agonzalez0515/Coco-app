class TopicsController < ApplicationController

  def show
    @user = current_user
    @messages = Message.where(topic_id: params[:id]).order("updated_at")
    @topics = Topic.all
    @topic_id = params[:id]
  end
end
