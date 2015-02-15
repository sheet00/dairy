class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :file_name, :null => false
      t.string :name, :null => false
    end
 end
end
