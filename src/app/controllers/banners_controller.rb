class BannersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def new
    @banner = Banner.new
    respond_with @banner
  end

  def create
    @banner = Banner.new(params[:banner])

    if @banner.save
      redirect_to admin_dashboard_path, notice: "Successfully created banner."
    else
      render :action => 'new'
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_with @banner
  end
end
