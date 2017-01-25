class TopicsController < ApplicationController

  def new
    @user = current_user
    @messages = Message.where(topic_id: params[:id]).order("updated_at")
    @topics = Topic.all
    @topic_id = params[:id]
  end

  def create
    @user = current_user
    @message
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to @message
    else
      @errors = @tag.errors.full_messages
      redirect_to @message
    end
  end

  private
    def message_params
      message_params = { title: params[:message][:title],
                       body: params[:message][:body],
                       topic_id: params[:message][:topic_id],
                       user_id: current_user.id }
    end

  end
end
