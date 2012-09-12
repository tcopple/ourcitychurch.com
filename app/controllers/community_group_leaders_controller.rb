class CommunityGroupLeadersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def dashboard

  end

  def create
    @leader = CommunityGroupLeader.new(params[:community_group_leader])
    flash[:notice] = 'Leader was successfully created.' if @leader.save
    respond_with @leader
  end

  def update
    @leader = CommunityGroupLeader.find(params[:id])
    flash[:notice] = "Successfully updated leader." if @leader.update_attributes(params[:community_group_leader])
    respond_with @leader
  end

  def destroy
    @leader = CommunityGroupLeader.find(params[:id])
    @leader.destroy

    respond_with @leader
  end
end
