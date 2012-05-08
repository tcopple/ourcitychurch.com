class ResourcesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(params[:resource])
    if @resource.save
      redirect_to admin_dashboard_path, :notice => "Successfully created resource."
    else
      render :action => 'new'
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to admin_dashboard_path, :notice => "Successfully destroyed resource."
  end
end
