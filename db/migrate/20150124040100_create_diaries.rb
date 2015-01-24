class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.date :authored_on, :null=>false
      t.integer :category_id, :null=>false
      t.string :title, :null=>false
      t.string :body, :null=>false
      t.integer :wheather_id
      t.integer :mt_id

      t.timestamps null: false

      t.index :authored_on
    end    
  end
end
