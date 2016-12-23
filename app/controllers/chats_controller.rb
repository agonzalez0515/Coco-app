class ChatsController < ApplicationController
  before_action :get_chats

  def index
  end

  def create
    chat = current_user.chats.build(chat_params)
    chat.body_en = EasyTranslate.translate(chat.body, :to => :en, :key => ENV['NEW_KEY_TRANSLATE'])
    chat.body_es = EasyTranslate.translate(chat.body, :to => :es, :key => ENV['NEW_KEY_TRANSLATE'])
    chat.save
    if chat.body_es && chat.body_en
      ActionCable.server.broadcast 'room_channel',
            body_en: chat.body_en,
            body_es: chat.body_es,
            name: chat.user.first_name,
            created_at: chat.created_at
      head :ok 
    end
  end

  private

    def get_chats
      if current_user
        @chats = Chat.for_display
        @chat  = current_user.chats.build
      else
        redirect_to '/login'
      end
    end

    def chat_params
      params.require(:chat).permit(:body)
    end
end