class DropforeignKeys < ActiveRecord::Migration[7.1]
  def change
    drop_table :foreign_keys   
  end
end
