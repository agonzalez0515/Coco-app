class AddTopicToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :topic_id, :integer
  end
end
