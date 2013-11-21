class Song < ActiveRecord::Base
  validates_presence_of :title, :artist
end
