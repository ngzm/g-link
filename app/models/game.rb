#
# Game model class
#
class Game < ApplicationRecord
  has_many :instructions, dependent: :destroy
  has_many :reviews
  has_many :users, through: :reviews
end
