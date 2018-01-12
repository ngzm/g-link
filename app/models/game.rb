#
# Game model class
#
class Game < ApplicationRecord
  has_many :instructions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  mount_uploader :img, ImgUploader

  validate :img_size

  # Get instructions of the game
  def ordered_instructions
    instructions.sort_by(&:id)
  end

  # Get reviews of the game, which is newer top N
  def newer_reviews_top(num)
    (reviews.sort { |a, b| b.updated_at <=> a.updated_at })[0, num]
  end

  # increment game access column
  def increment_access
    update! access: access + 1
  end

  private

  def img_size
    errors.add(:img, 'should be less than 5MB') if img.size > 5.megabytes
  end
end
