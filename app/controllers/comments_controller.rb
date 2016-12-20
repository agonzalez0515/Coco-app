class CommentsController < ApplicationController

  def index
    @message = Message.find(params[:message_id])
    @comments = @message.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to message_comments_path(@message)
    else
      render "new"
    end
  end

  def show
    @message = Message.find(params[:message_id])
    @comment = Comment.find(params[:id])
  end

  def edit
    @message = Message.find(params[:message_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @message = Message.find(params[:message_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to message_comments_path(@message)
    else
      render "edit"
    end
  end

  def destroy
    @message = Message.find(params[:message_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to message_comments_path(@message)
    else
      redirect_to message_comments_path(@message)
    end
  end

private

  def comment_params
    @message = Message.find(params[:message_id])
    message_params = { body: params[:comment][:body],
                       message_id: @message.id,
                       user_id: current_user.id }
  end

end
