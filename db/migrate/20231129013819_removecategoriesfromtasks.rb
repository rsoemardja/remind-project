class Removecategoriesfromtasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :categories, :string
  end
end
