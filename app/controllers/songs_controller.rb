class SongsController < ApplicationController
  def create
    # TODO strong params?
    sound = Sound.new({ url: params[:url] })

    @song = Song.new(song_params)

    # @song.save!
    redirect_to :root
  end


  private
    def song_params
      params.require(:song)
            .permit(:title, :artist, :url)
    end
end
