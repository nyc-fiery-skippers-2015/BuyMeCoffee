class AddQuestionToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :question, :string, null: false
  end
end