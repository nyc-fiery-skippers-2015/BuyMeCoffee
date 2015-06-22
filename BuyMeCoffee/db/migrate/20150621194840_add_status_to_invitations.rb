class AddStatusToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :status, :boolean, default: false
    add_column :invitations, :user_id, :integer
  end
end
