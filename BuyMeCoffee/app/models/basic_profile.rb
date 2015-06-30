class BasicProfile < ActiveRecord::Base
  has_many :positions
  belongs_to :user

end
