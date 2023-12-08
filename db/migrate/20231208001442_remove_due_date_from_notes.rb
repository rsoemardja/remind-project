class RemoveDueDateFromNotes < ActiveRecord::Migration[7.1]
  def change
    remove_column :notes, :due_date, :date
  end
end
