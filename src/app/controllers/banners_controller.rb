class BannersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def new
    @banner = Banner.new
    respond_with @banner
  end

  def create
    @banner = Banner.new(params[:banner])

    front = params["start_on"]
    back = params["end_on"]

    starts_on = DateTime.new(front["starting date(1i)"].to_i,
                            front["starting date(2i)"].to_i,
                            front["starting date(3i)"].to_i,
                            front["starting date(4i)"].to_i,
                            front["starting date(5i)"].to_i)

    ends_on = DateTime.new(back["ending date(1i)"].to_i,
                           back["ending date(2i)"].to_i,
                           back["ending date(3i)"].to_i,
                           back["ending date(4i)"].to_i,
                           back["ending date(5i)"].to_i)

    @banner.start_on = starts_on
    @banner.end_on = ends_on

    if @banner.save
      redirect_to admin_dashboard_path, notice: "Successfully created banner."
    else
      render :action => 'new'
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    if @banner.destroyed?
      redirect_to admin_dashboard_path, notice: "Successfully removed banner."
    else
      redirect_to admin_dashboard_path, notice: "Could not remove banner." << @banner.errors.join('\n')
    end
  end
end
