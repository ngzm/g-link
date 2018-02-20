#
# User model class
#
class User < ApplicationRecord
  has_many :reviews
  has_many :games, through: :reviews

  validates :name, presence: true
  validates :full_name, presence: true
  validates :identifer, uniqueness: true, allow_nil: true

  def self.create_or_update(profile)
    user = User.find_by(identifer: profile[:identifer])
    if user.nil?
      user = User.create! profile
    else
      user.update! profile
    end
    user
  end
end
