class AdminsController < ApplicationController
  include ApplicationHelper

  before_filter :authenticate_user!

  def dashboard
    @banners = Banner.all
    @pages = build_menu_hash
    @resources = Resource.all
    @images = Image.all
    @community_groups = CommunityGroup.all
    @community_group_leaders = CommunityGroupLeader.all
  end
end
