class AddColumnDueDateToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :due_date, :date
  end
end
