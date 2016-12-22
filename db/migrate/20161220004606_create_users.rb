class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_type
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :lang_preference
      t.integer :grade_level

      t.timestamps
    end
  end
end
