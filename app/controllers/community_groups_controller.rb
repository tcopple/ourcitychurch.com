class CommunityGroupsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def new
    @group = CommunityGroup.new
    @group.build_address
    @group.leaders.build
    respond_with @group
  end

  def create
    @group = CommunityGroup.new(params[:community_group])

    if @group.save
      redirect_to admin_dashboard_path, notice: "Successfully created community group."
    else
      render :action => 'new'
    end
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

    redirect_to admin_dashboard_path, :notice => "Successfully destroyed community group."
  end
end
