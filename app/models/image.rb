class Image < ApplicationRecord
  belongs_to :gift
  mount_uploader :name, ImageUploader
  validates :gift_id, length:{ in 1..10}
end
