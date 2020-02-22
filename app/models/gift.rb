class Gift < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :shipping_methods, dependent: :destroy
  accepts_nested_attributes_for :images, :shipping_methods, allow_destroy: true
end
