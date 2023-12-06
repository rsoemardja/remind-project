class AddInTrashToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :in_trash, :boolean
  end
end
