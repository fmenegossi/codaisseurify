class Song < ApplicationRecord
  belongs_to :artist

	validates :title, presence: true, length: { minimum:3, maximum: 30 }
end
