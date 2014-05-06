class MembershipsController < ApplicationController
  before_action :authenticate_user!
  
  respond_to :html, :js

  def create
    @group = Group.find(params[:membership][:group_id])
    @group.add_member!(current_user) unless @group.blank?
    respond_with @group
  end

  def destroy
    @group = Membership.find(params[:id]).group
    @group.remove_member!(current_user) unless @group.blank?
    respond_with @group
  end

end