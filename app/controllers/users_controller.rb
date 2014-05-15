class UsersController < ApplicationController
  before_action :authenticate_user!

  # show all groups
  #
  def index
    @users = User.all();
  end

  # show a specific group
  #
  def show
    @user = User.find(params[:id])

    # maybe should be on seperate page?
    @group_to_create = Group.new
  end

  # TODO not sure how this is handled by devise
  # def create
  # end

  # def destroy
  # end

end
