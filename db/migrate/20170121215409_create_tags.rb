class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :title
      t.integer :message_id
      t.integer :count

      t.timestamps
    end
  end
end
