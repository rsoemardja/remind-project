class CreateForeignKey < ActiveRecord::Migration[7.1]
  def change
    create_table :foreign_keys do |t|
      t.string :user_id
      
      t.timestamps
    end
  end
end
