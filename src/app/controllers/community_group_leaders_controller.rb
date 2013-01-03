class CommunityGroupLeadersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def dashboard
  end

  def new
    @leader = CommunityGroupLeader.new
    respond_with @leader
  end

  def create
    @leader = CommunityGroupLeader.new(params[:community_group_leader])
    @leader.password = "#{@leader.last.downcase}#{@leader.first.downcase}"

    if @leader.save
      redirect_to admin_dashboard_path, notice: "Successfully created leader."
    else
      render :action => 'new'
    end
  end

  def edit
    @leader = CommunityGroupLeader.find(params[:id])
    respond_with @leader
  end

  def update
    @leader = CommunityGroupLeader.find(params[:id])
    flash[:notice] = "Successfully updated leader." if @leader.update_attributes(params[:community_group_leader])
    if @leader.save
      redirect_to admin_dashboard_path, notice: "Successfully created leader."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @leader = CommunityGroupLeader.find(params[:id])
    @leader.destroy

    redirect_to admin_dashboard_path
  end
end
