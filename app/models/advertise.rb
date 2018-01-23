class Advertise < ApplicationRecord
  validates :title, presence: true
  validates :src, presence: true
  validates :adtype, presence: true, numericality: { only_integer: true }
  validates :priority, presence: true, numericality: { only_integer: true }
  validates :show, inclusion: { in: [true, false] }
end
