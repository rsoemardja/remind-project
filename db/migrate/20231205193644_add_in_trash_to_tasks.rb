class AddInTrashToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :in_trash, :boolean
  end
end
