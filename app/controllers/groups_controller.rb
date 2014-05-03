class GroupsController < ApplicationController
  before_action :authenticate_user!

  # show all groups
  #
  def index
    @groups = Group.all();
  end

  # show a specific group
  #
  def show
    @group = Group.find(params[:id])
  end


  def create

  end

  def destroy

  end

end