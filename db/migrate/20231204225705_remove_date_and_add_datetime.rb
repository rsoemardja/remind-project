class RemoveDateAndAddDatetime < ActiveRecord::Migration[7.1]
  def change
    change_column :tasks, :due_date, :datetime, null: false
    change_column :notes, :due_date, :datetime, null: false
  end
end
