class BannersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def new
    @banner = Banner.new
    respond_with @banner
  end

  def create
    @banner = Banner.new(params[:banner])
    flash[:notice] = 'Banner was successfully created.' if @banner.save
    respond_with @banner
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_with @banner
  end
end
