class AdminsController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    @banners = Banner.all
    @pages = Page.all
    @resources = Resource.all
    @images = Image.all
  end
end
