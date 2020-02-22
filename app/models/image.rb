class Image < ApplicationRecord
  belongs_to :gift
  mount_uploader :name, ImageUploader
end
