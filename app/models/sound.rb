class Sound < ActiveRecord::Base
  validates_presence_of :sound_type, :location, :song
  belongs_to :song, inverse_of: :sounds
end
