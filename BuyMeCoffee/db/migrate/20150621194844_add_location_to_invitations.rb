class AddLocationToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :location, :string
  end
end