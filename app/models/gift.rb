class Gift < ApplicationRecord
  has_many :images, dependent: :destroy
  has_one :shipping_method, dependent: :destroy
  accepts_nested_attributes_for :images, :shipping_method, allow_destroy: true
end
