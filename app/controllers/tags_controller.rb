class TagsController < ApplicationController

  protect_from_forgery

  def new
    @tag = Tag.new
  end

  def create
    @user = current_user
    @message = Message.find(params[:tag][:message_id])
    temp_tags = @message.tags
    if temp_tags.where(title: params[:tag][:title]).length >= 1
      @tag_to_increment = temp_tags.where(title: params[:tag][:title])[0]
      @tag_to_increment.count += 1
      @tag_to_increment.save
      redirect_to Message.find(params[:tag][:message_id])
    else
      @tag = Tag.new(tag_params)
      if @tag.save
        redirect_to Message.find(params[:tag][:message_id])
      else
        @errors = @tag.errors.full_messages
        redirect_to Message.find(params[:tag][:message_id])
      end
    end
  end

  def like
    @tag = Tag.find(params[:id])
    @tag.count += 1
    @tag.save

    render json: {'title': @tag.title, 'count': @tag.count.to_s}
  end

private
  def tag_params
    tag_params = { title: params[:tag][:title],
                     message_id: params[:tag][:message_id],
                     count: params[:tag][:count] }
  end
end
