class AddBodyEsToChats < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :body_es, :text
  end
end
