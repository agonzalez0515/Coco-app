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
      redirect_to message_comments_path
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
      redirect_to message_comments_path
    else
      render "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render status: 200
    else
      render json: ErrorSerializer.serialize(@comment.errors), status: 422
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body, :message_id, :user_id)
  end

end
