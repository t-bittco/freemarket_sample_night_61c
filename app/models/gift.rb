class Gift < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true, length: { maximum: 40 }
  validates :discription, presence: true
  validates :state, presence: true
  validates :price, presence: true
  validates :shipping_charge, presence: true
  validates :how_to_ship, presence: true
  validates :sender_region, presence: true
  validates :days_to_ship, presence: true
  validates :category_id, presence: true
end
