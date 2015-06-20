class CreateUsersCategories < ActiveRecord::Migration
  def change
    create_table :users_categories do |t|
      t.references :user, null: false
      t.references :category, null: false
    end
  end
end