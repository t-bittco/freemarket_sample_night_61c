class Image < ApplicationRecord
  belongs_to :gift, optional: true
  mount_uploader :name, ImageUploader

  validates :name, presence: true
end
