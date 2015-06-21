class RemovePicLocFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :pic_loc, :string
  end
end
