class Sound < ActiveRecord::Base
  validates_presence_of :sound_type, :location, :song
  belongs_to :song, inverse_of: :sounds
  validates_uniqueness_of :location, scope: :sound_type
end
