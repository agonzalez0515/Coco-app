class MessagesController < ApplicationController

  protect_from_forgery except: :search
  before_action :get_user
  before_action :set_message, only: [ :show, :edit, :update, :destroy]

  def index
    @user = User.new
    @messages = Message.all
    @topics = Topic.all
  end

  def new
    @user = current_user
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
    @user = current_user
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

  def search
    if params[:message_string] && params[:message_string].length > 0
      @messages = (helpers.message_search(params[:message_string]))
    end
    render "messages/_search"
end

private
  def get_user
    if !current_user
      redirect_to root_path
    end
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    message_params = { title: params[:message][:title],
                     body: params[:message][:body],
                     user_id: current_user.id }
  end

end
