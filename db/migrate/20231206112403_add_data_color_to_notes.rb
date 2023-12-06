class AddDataColorToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :data_color, :string
  end
end
