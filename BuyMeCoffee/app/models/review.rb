class Review < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_one :user
end
