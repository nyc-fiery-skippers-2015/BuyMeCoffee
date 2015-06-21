class User < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :review
  has_many :reviews, foreign_key: 'author_id'

  validates :name, presence: true
  validates :about, presence: true
  validates :pic_loc, presence: true
  devise : omniauthable

  def self.online_users
    User.includes(:categories).where(status: true)
  end
class << self
  def from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.location = get_social_location_for user.provider, auth_hash['info']['location']
    user.image_url = auth_hash['info']['image']
    user.url = get_social_url_for user.provider, auth_hash['info']['urls']
    user.save!
    user
  end

  private

  def get_social_location_for(provider, location_hash)
    case provider
      when 'linkedin'
        location_hash['name']
      else
        location_hash
    end
  end

  def get_social_url_for(provider, urls_hash)
    case provider
      when 'linkedin'
        urls_hash['public_profile']
      else
        urls_hash[provider.capitalize]
    end
  end
end


end
