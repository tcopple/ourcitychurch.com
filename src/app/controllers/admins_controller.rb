class AdminsController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    @banners = Banner.all
    @roots = Page.where(:parent => nil).order_by(:menu_title, :asc)
    @tree = Hash[ @roots.collect { |r| [r.title, Page.where(parent: r.title).order_by(:order, :asc)] } ]
    @resources = Resource.all
    @images = Image.all
    @community_groups = CommunityGroup.all
    @community_group_leaders = CommunityGroupLeader.all
  end
end
