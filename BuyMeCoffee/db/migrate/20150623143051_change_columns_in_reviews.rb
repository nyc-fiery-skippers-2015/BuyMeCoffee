class ChangeColumnsInReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :user_id
    add_column :reviews, :mentor_id, :integer
  end
end