class User < ActiveRecord::Base
  has_secure_password
  has_many :skills
  has_and_belongs_to_many :categories
  # belongs_to :review

  has_many :reviews, foreign_key: 'mentor_id'
  has_many :authored_reviews, foreign_key: 'author_id', class_name: 'Review'

  has_many :invitations
  has_many :invitations, foreign_key: 'mentor_id'

  validates :name, presence: true
  validates :about, presence: true

  has_one :basic_profile
  has_one :linkedin_oauth_settin



  def self.online_users
    User.includes(:categories).where(status: true)
  end

  def rating
    reviews.average(:rating)
  end


  def skill_list
    self.skills.collect do |skill|
      skill.name
    end.join(", ")
  end

  def skill_list=(skills_string)
    skill_names = skills_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_skills = skill_names.collect { |name| Skill.find_or_create_by(name: name)}
    self.skills = new_or_found_skills
  end
end
