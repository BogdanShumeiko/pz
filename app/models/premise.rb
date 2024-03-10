class Premise < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :cost, presence: true, numericality: {greater_than: 0 }
  validates :rooms, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :square_meters, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
