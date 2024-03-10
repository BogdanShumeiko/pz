class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25 }
  validates :cost, presence: true, numericality: {greater_than: 0 }
end
