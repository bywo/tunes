class Song < ActiveRecord::Base
  validates_presence_of :title, :artist
  has_many :sounds, inverse_of: :song, dependent: :destroy
end
