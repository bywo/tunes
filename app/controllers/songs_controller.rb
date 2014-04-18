class SongsController < ApplicationController
  def create
    # TODO strong params?
    @song = Song.new(song_params)
    @song.save

    sound = Sound.new({
      :sound_type => params[:sound][:sound_type],
      :location => params[:sound][:location],
      :song => @song
    })
    sound.save

    # @song.save!
    redirect_to :root
  end


  private
    def song_params
      params.require(:song)
            .permit(:title, :artist)
    end
end
