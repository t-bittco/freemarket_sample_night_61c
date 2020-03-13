class Category < ApplicationRecord
  has_many :gifts
  has_ancestry
  has_and_belongs_to_many :brands
end
