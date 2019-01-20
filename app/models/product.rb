class Product < ApplicationRecord
  resourcify
  has_many_attached :images
end
