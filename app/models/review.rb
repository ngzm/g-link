#
# Game reiew model
#
class Review < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :game_id,
            presence: true,
            numericality: { only_integer: true, allow_blank: true }

  validates :user_id,
            presence: true,
            numericality: { only_integer: true, allow_blank: true }

  validates :star,
            presence: true,
            inclusion: { in: (0..5).to_a, allow_blank: true }

  validates :comment, presence: true

  class << self
    # create game review and update game table star
    def create_review(review)
      Review.transaction do
        rv = Review.create!(review)
        rv.update_game_star if rv
        return rv
      end
    end
  end

  # update game review and update game table star
  def update_review(review)
    Review.transaction do
      update! review
      update_game_star
    end
  end

  # update game table with average stars on review table
  def update_game_star
    star_avg = Review.where(game_id: game_id).average(:star).round
    game.update!(star: star_avg)
  end
end
