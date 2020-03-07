class Image < ApplicationRecord
  belongs_to :gift, optional: true
  mount_uploader :name, ImageUploader

  validate :check_number_of_images
  def check_number_of_images
    if gift && gift.images.count > 10
      errors.add(:gift, "イメージ保存は10枚まで")
  end
end
