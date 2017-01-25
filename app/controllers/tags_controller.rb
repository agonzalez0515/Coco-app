class TagsController < ApplicationController

  protect_from_forgery

  def new
    @tag = Tag.new
  end

  def create
    @user = current_user
    @message = Message.find(params[:tag][:message_id])
    @tag = Tag.new(tag_params)
    # if @message.tags.where(title: params[:tag][:title]).length > 1
    #   @tag.count += 1
    # end
    if @tag.save
      redirect_to Message.find(params[:tag][:message_id])
    else
      @errors = @tag.errors.full_messages
      redirect_to Message.find(params[:tag][:message_id])
    end
  end

private
  def tag_params
    tag_params = { title: params[:tag][:title],
                     message_id: params[:tag][:message_id],
                     count: params[:tag][:count] }
  end
end
