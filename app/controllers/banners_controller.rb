class BannersController < ApplicationController
  before_filter :authenticate_user!

  # GET /banners/new
  # GET /banners/new.json
  def new
    @banner = Banner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @banner }
    end
  end

  # POST /banners
  # POST /banners.json
  def create
    @banner = Banner.new(params[:banner])

    respond_to do |format|
      if @banner.save
        format.html { redirect_to admin_dashboard_path, notice: 'Banner was successfully created.' }
        format.json { render json: @banner, status: :created, location: @banner }
      else
        format.html { render action: "new" }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.json
  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to admin_dashboard_path }
      format.json { head :ok }
    end
  end
end
