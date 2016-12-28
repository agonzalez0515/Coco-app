class AddYearsRequiredToRequirements < ActiveRecord::Migration[5.0]
  def change
    add_column :requirements, :years_required, :float
  end
end
