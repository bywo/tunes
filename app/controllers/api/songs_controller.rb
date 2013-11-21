class Api::SongsController < ApplicationController
  respond_to :json

  def index
    respond_with Song.all
  end

  def show
    respond_with Song.find(params[:id])
  end

  def create
    respond_with Song.create(post_params)
  end

  def update
    respond_with Song.update(params[:id], post_params)
  end

  def destroy
    respond_with Song.destroy(params[:id])
  end

  private

  def post_params
    params.require(:song).permit(:title, :artist)
  end
end
