class User < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :review
  has_many :reviews, foreign_key: 'author_id'


  def self.online_users
    User.includes(:categories).where(status: true)
  end

end
