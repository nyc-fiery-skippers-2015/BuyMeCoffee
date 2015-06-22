class AddApositionToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :lat
    remove_column :users, :lng
    add_column :users, :latitude, :string
    add_column :users, :longitude, :string
  end
end