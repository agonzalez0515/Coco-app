class TopicsController < ApplicationController

  def show
    @user = current_user
    # @messages = Message.paginate(:page => params[:page], :per_page => 5).order("updated_at")
    @messages = Message.where(topic_id: params[:id]).paginate(:page => params[:page], :per_page => 5).order("updated_at")
    @topics = Topic.all
    @topic_id = params[:id]
  end
end
