class Api::KeysController < ApplicationController
  respond_to :json

  def index
    keys = {:soundcloud => ENV['SOUNDCLOUD_KEY']}
    respond_with keys
  end
end
