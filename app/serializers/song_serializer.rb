class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist

  # include sounds
  has_many :sounds
end
