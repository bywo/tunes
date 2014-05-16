class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.add_owner!(current_user)
    else
      # TODO
      flash[:error] = "Group failed to be created"
    end

    redirect_to current_user
  end


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

  def destroy
    @group.destroy
    redirect_to current_user
  end

  private
    def group_params
      params.require(:group)
            .permit(:name, 
                    :description)
    end

    def correct_user
      @group = current_user.memberships.find_by(group_id: params[:id], owner: true).try(:group)
      redirect_to root_url if @group.nil?
    end

end