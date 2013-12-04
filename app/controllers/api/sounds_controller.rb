class Api::SoundsController < ApplicationController
  respond_to :json

  def index
    @song = Song.find(params[:song_id])
    respond_with @song.sounds.load
  end

  def show
    respond_with Sound.find(params[:id])
  end

  def create
    @song = Song.find(params[:song_id])
    @sound = @song.sounds.create(post_params)
    respond_with(:api, @sound)
  end

  def update
    respond_with Sound.update(params[:id], post_params)
  end

  def destroy
    respond_with Sound.destroy(params[:id])
  end

  private

  def post_params
    params.require(:sound).permit(:sound_type, :location)
  end
end

