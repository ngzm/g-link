#
# Game model class
#
class Game < ApplicationRecord
  has_many :instructions, dependent: :destroy
  has_many :reviews
  has_many :users, through: :reviews

  # Get instructions of the game
  def ordered_instructions
    instructions.sort_by(&:id)
  end

  # Get reviews of the game, which is newer top N
  def newer_reviews_top(num)
    (reviews.sort { |a, b| b.updated_at <=> a.updated_at })[0, num]
  end
end
