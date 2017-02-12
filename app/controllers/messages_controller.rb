class MessagesController < ApplicationController

  protect_from_forgery except: :search
  before_action :get_user
  before_action :set_message, only: [ :show, :edit, :update, :destroy]

  def index
    @user = User.new
    @messages = Message.paginate(:page => params[:page], :per_page => 5).order("updated_at")
    @topics = Topic.all
  end

  def new
    @user = current_user
    @message = Message.new
    @topics = Topic.all
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
    @user = current_user
    @message = Message.find(params[:id])
    @topics = Topic.all
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to @message
    else
      @errors = @message.errors.full_messages
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
                     topic_id: params[:message][:topic_id],
                     user_id: current_user.id }
  end

end
