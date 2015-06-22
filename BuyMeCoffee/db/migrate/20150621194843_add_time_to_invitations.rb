class AddTimeToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :agreed_time, :string
  end
end