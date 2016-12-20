
class ChatsController < ApplicationController

	# before_action :logged_in_user
  before_action :get_chats

  def index
  end

  def create

    chat = current_user.chats.build(chat_params)
    if chat.save
      ActionCable.server.broadcast 'room_channel',
                                   body:  chat.body,
                                   name: chat.user.first_name
      head :ok
    end
  end

  private

    def get_chats
      @chats = Chat.for_display
      @chat  = current_user.chats.build
    end

    def chat_params
      params.require(:chat).permit(:body)
    end
end