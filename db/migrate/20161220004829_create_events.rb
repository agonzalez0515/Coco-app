class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :sat_id
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
