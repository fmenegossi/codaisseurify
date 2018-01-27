class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :style

  has_many :songs
end
