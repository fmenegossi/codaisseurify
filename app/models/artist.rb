class Artist < ApplicationRecord
	has_many :songs, dependent: :destroy
	mount_uploader :image, ImageUploader

	validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
	validates :style, presence: true, length: { minimum: 3, maximum: 20 }
end
