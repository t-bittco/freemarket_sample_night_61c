class Gift < ApplicationRecord
  # belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, length: { in: 1..40 }
  validates :discription, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :charge_id, presence: true
  validates :how_to_ship_id, presence: true
  validates :region_id, presence: true
  validates :days_id, presence: true
  validates :listing_state, presence: true
  validates :price, presence: true
  validates_associated :images
  validate :count_images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :days
  belongs_to_active_hash :how_to_ship
  belongs_to_active_hash :region

  private
  def count_images
    errors.add(:image, "は1枚以上") if images.size == 0
    eorros.add(:image, "は10枚以下") if images.size > 10
  end
end
