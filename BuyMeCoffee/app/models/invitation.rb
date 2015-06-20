class Invitation < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :mentor, class_name: 'user'
end
