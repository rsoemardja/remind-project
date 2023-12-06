class Removecategoriesfromnotes < ActiveRecord::Migration[7.1]
  def change
    remove_column :notes, :categories, :string
  end
end
