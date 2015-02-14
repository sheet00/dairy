class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories, :id => false do |t|
      t.integer :id, :null => false
      t.integer :no, :null => false
      t.string :name

      t.timestamps null: false
    end

    add_index :categories, :id, :unique => true
    add_index :categories, :no, :unique => true
  end
end
