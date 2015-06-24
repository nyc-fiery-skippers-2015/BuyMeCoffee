class Review < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_one :mentor, class_name: 'User'

  validates_uniqueness_of :mentor_id, scope: :author_id, :message => 'You have already rated this user!'
end
