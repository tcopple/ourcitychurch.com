class ImagesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def new
    @image = Image.new

    respond_with @image
  end

  def create
    @image = Image.new(params[:image])

    respond_with do |format|
      if @image.save
        format.html { redirect_to admin_dashboard_path, notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @image = Image.find(params[:id])
    respond_with @image
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    respond_with @image
  end
end
