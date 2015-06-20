class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :mentor_id, null: false
      t.timestamps null: false
    end
  end
end
