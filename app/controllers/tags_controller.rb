class TagsController < ApplicationController

  def new
    @tag = Tag.new
  end

  def create
    @user = current_user
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to Message.find(params[:tag][:message_id])
    else
      @errors = @tag.errors.full_messages
      redirect_to Message.find(params[:tag][:message_id])
    end
  end

private
  def message_params
    message_params = { title: params[:tag][:title],
                     message_id: params[:tag][:message_id],
                     count: params[:tag][:count] }
  end
end
