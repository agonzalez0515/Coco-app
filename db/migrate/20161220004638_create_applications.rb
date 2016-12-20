class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|

      t.timestamps
    end
  end
end
