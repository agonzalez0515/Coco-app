class ChangeColumnDefaultTitleForEvents < ActiveRecord::Migration[5.0]
  def change
    change_column_default :events, :title, "SAT Day"
  end
end
