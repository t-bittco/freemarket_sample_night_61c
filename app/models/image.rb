class Image < ApplicationRecord
  belongs_to :gift, optional: true
  mount_uploader :name, ImageUploader
end
