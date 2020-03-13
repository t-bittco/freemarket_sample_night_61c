class Category < ApplicationRecord
  has_many :gifts
  has_ancestry
end
