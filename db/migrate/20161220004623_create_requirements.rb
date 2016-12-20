class CreateRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :requirements do |t|
      t.string :subject
      t.float :years
      t.integer :user_id

      t.timestamps
    end
  end
end
