# class ChatsController < ApplicationController
#   # before_action :logged_in_user
#   before_action :get_chats

#   def index
#     @chats = Chat.all
#     t = translate(current_user, @chats)
#     @chats = t
#   end

#   def create
#     chat = current_user.chats.build(chat_params)
#     if current_user.lang_preference == 'spanish'
#       EasyTranslate.translate(chat.body, :to => :en, :key => ENV['NEW_KEY_TRANSLATE'])
#       if chat.save
#       ActionCable.server.broadcast 'room_channel',
#             body: chat.body,
#             name: chat.user.first_name
#       head :ok
#       end
#     elsif 
#       EasyTranslate.translate(chat.body, :to => :es, :key => ENV['NEW_KEY_TRANSLATE'])
#       if chat.save
#         ActionCable.server.broadcast 'room_channel',
#             body: chat.body,
#             name: chat.user.first_name
#       head :ok
#       end
#     end
#   end


#   def translate(current_user, chats)
#     @chats_translated = []
#     p current_user.lang_preference
#     if p current_user.lang_preference == 'english'
#       chats.each do |chat|
#         p chat
#       @chats_translated << [chat.user.first_name, EasyTranslate.translate(chat.body, :to => :en, :key => ENV['NEW_KEY_TRANSLATE'])]
#       end
#     else current_user.lang_preference == 'spanish'
#       chats.each do |chat|
#       @chats_translated << [chat.user.first_name, EasyTranslate.translate(chat.body, :to => :es, :key => ENV['NEW_KEY_TRANSLATE'])]
#       end
#     end
#     @chats_translated
#   end


#   private

#     def get_chats
#       @chats = Chat.for_display
#       @chat  = current_user.chats.build
#     end

#     def chat_params
#       params.require(:chat).permit(:body)
#     end
# end
















class ChatsController < ApplicationController
	# before_action :logged_in_user
  before_action :get_chats

  def index
  end

  def create
    chat = current_user.chats.build(chat_params)
    chat.body = EasyTranslate.translate(chat.body, :to => :es, :key => ENV['NEW_KEY_TRANSLATE'])
    if chat.save
      ActionCable.server.broadcast 'room_channel',
                                   body: chat.body,
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