#
# Game model class
#
class Game < ApplicationRecord
  has_many :instructions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  mount_uploader :img, ImgUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :img, presence: true
  validates :category1, presence: true, numericality: { only_integer: true }
  validates :category2, numericality: { only_integer: true }, allow_blank: true
  validates :category3, numericality: { only_integer: true }, allow_blank: true
  validates :access, numericality: { only_integer: true }, allow_blank: true
  validates :star, numericality: true, allow_blank: true
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
