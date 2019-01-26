class Product < ApplicationRecord
  resourcify
  has_many_attached :images
  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :premium_price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
