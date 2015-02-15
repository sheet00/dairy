class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.datetime :authored_on, :null=>false
      t.integer :category_id, :null=>false
      t.string :title, :null=>false
      t.text :body, :null=>false
      t.integer :weather_id
      t.integer :mt_id

      t.timestamps null: false

      t.index :authored_on
    end
  end
end
