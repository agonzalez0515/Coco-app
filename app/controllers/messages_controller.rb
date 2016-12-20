class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path
    else
      render "new"
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to message_comments_path(@message)
    else
      render "edit"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      redirect_to messages_path
    else
      redirect to message_comments_path(@message)
    end
  end

private

def message_params
  message_params = { title: params[:message][:title],
                     body: params[:message][:body],
                     user_id: current_user.id }

end

end