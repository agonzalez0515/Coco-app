class CreateSats < ActiveRecord::Migration[5.0]
  def change
    create_table :sats do |t|
      t.date :date
      t.string :address
      t.string :location_name

      t.timestamps
    end
  end
end
