#
# Instruction  model class
#
class Instruction < ApplicationRecord
  belongs_to :game

  validates :explanation, presence: true
  validates :step, presence: true, numericality: { only_integer: true }
  validates :game_id, presence: true, numericality: { only_integer: true }
end
