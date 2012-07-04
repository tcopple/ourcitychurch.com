class AdminsController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    @banners = Banner.all
    @roots = Page.where(:parent => nil).order_by(:menu_title, :asc)
    @tree = Hash[ @roots.collect { |r| [r.title, Page.where(parent: r.title).order_by(:order, :asc)] } ]
    @resources = Resource.all
    @images = Image.all
  end
end
