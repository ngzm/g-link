class Game < ApplicationRecord
  has_many :instructions, dependent: :destroy
end
