class AddBodyEnToChats < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :body_en, :text
  end
end
