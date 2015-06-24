class Invitation < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :mentor, class_name: 'user'

  def self.any_invites?(input)
    where(mentor_id: input, status: false).length > 0
  end
end
