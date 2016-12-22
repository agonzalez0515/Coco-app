class ChatsController < ApplicationController
  # before_action :logged_in_user
  before_action :get_chats

  def index
  end

  def create
    chat = current_user.chats.build(chat_params)
    chat.body_en = EasyTranslate.translate(chat.body, :to => :en, :key => ENV['NEW_KEY_TRANSLATE'])
    chat.body_es = EasyTranslate.translate(chat.body, :to => :es, :key => ENV['NEW_KEY_TRANSLATE'])
    chat.save
    if chat.body_es && chat.body_en
      p chat.body_es
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
      @chats = Chat.for_display
      @chat  = current_user.chats.build
    end

    def chat_params
      params.require(:chat).permit(:body)
    end
end