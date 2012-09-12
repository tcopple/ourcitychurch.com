class CommunityGroupsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def new
    @group = CommunityGroup.new
    respond_with @group
  end

  def create
    @group = CommunityGroup.new(params[:community_group])

    flash[:notice] = 'CommunityGroup was successfully created.' if @group.save
    respond_with @group
  end

  def edit
    @group = CommunityGroup.new(params[:community_group])
    respond_with @group
  end

  def update
    @group = CommunityGroup.find(params[:id])
    flash[:notice] = "Successfully updated community group." if @group.update_attributes(params[:group])
    respond_with @group
  end

  def destroy
    @group = CommunityGroup.find(params[:id])
    @group.destroy

    respond_with @group
  end
end
