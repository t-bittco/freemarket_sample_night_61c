class Brand < ApplicationRecord
  has_many :gifts
  has_and_belongs_to_many :category
end
