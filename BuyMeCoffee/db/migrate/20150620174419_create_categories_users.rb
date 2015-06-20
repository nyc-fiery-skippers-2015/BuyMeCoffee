class CreateCategoriesUsers < ActiveRecord::Migration
  def change
    create_table :categories_users do |t|
      t.references :user, null: false
      t.references :category, null: false
    end
  end
end