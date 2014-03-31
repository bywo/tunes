class StaticPagesController < ApplicationController

  def home
    @song = Song.new
    # TODO add pagination
    # @users = User.all
    @songs = Song.all
    # binding.pry
    # @groups = Group.all
  end
end
