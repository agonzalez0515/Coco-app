class MessagesController < ApplicationController
    
  before_action :set_message, only: [ :show, :edit, :update, :destroy]

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
      @errors = @message.errors.full_messages
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to message_comments_path(@message)
    else
      render "edit"
    end
  end

  def destroy
    if @message.destroy
      redirect_to messages_path
    else
      redirect to message_comments_path(@message)
    end
  end

private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    message_params = { title: params[:message][:title],
                     body: params[:message][:body],
                     user_id: current_user.id }
  end

end