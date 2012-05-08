class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def show
    @page = Page.find(params[:permalink] || params[:id])
    redirect_to @page.link if not @page.link.nil? and not @page.link.empty?
  end

  def edit
    @page = Page.find(params[:permalink] || params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice  => "Successfully updated static page."
    else
      render :action => 'edit'
    end
  end

  def new
    @page = Page.new

    respond_to do |format|
      format.html
      format.json { render json @page }
    end
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_path, :notice => 'Page successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
