class PagesController < ApplicationController
  # before_filter :authenticate_user!, :except => [:show]
  respond_to :html, :json

  def show
    @page = Page.find(params[:permalink] || params[:id])

    #there's a more oo tricksy way to to this but it's late
    #and dynamically loaded content needs to be loaded differently
    #from user editable content
    if @page.editable?
      redirect_to @page.link if not @page.link.nil? and not @page.link.empty?
    else
      send(@page.permalink.gsub('-','_'))
    end
  end

  def edit
    @page = Page.find(params[:permalink] || params[:id])
    respond_with @page
  end

  def update
    @page = Page.find(params[:permalink] || params[:id])
    flash[:notice] = "Successfully updated static page." if @page.update_attributes(params[:page])
    respond_with @page
  end

  def new
    @page = Page.new
    respond_with @page
  end

  def create
    @page = Page.new(params[:page])
    flash[:notice] = 'Page successfully created.' if @page.save
    respond_with @page
  end

  def swap_order
    @left = Page.find(params[:id])
    @right = Page.find(params[:other])

    m = @left.order
    n = @right.order

    @left.update_attributes(order: n)
    @right.update_attributes(order: m)

    # respond_with({up: @left, down: @right})
    redirect_to admin_dashboard_path
  end

  def community_groups
    @community_groups = CommunityGroup.all
    @json = @community_groups.select {|a| a.mappable? }.to_gmaps4rails do |cg, marker|
      # marker.infowindow render_to_string partial: "/pages/community_group", locals: { group: cg }
      "\"id\": \"#{cg.id}\""
    end

    render action: :community_groups
  end
end
