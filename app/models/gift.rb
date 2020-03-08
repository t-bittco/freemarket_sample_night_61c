class Gift < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, length: { in: 1..40 }
  validates :discription, presence: true
  validates :state, presence: true
  validates :price, presence: true
  validates :shipping_charge, presence: true
  validates :how_to_ship, presence: true
  validates :sender_region, presence: true
  validates :days_to_ship, presence: true
  validates :category_id, presence: true
  validates :listing_state, presence: true
  validates_associated :images
  validate :count_images

  private
  def count_images
    errors.add(:image, "は1枚以上") if images.size < 0
    eorros.add(:image, "は10枚以下") if images.size > 10
  end
end
