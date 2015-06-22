class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :categories
  belongs_to :review
  has_many :reviews, foreign_key: 'author_id'
  has_many :invitations
  has_many :invitations, foreign_key: 'mentor_id'

  validates :name, presence: true
  validates :about, presence: true
  # validates :pic_loc, presence: true


  def self.online_users
    User.includes(:categories).where(status: true)
  end

end
