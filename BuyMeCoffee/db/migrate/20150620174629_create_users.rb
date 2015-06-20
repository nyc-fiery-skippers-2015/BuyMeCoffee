class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :about, null: false
      t.string :pic_loc, null: false

      t.timestamps null: false
    end
  end
end
