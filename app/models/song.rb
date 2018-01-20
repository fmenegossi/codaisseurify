class Song < ApplicationRecord
  belongs_to :artist

	validates :title, presence: true, length: {minimum: 1, maximum: 30}
end
