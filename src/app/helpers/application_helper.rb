module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new({hard_wrap: false, fitler_html: true})
    markdown = Redcarpet::Markdown.new(renderer, {no_intra_emphasis: true, autolink: true})
    markdown.render(text).html_safe
  end

  def build_menu_hash
    Hash.new.tap do |menu|
      Page.where(visible: true).any_of({parent: ""}, {parent: nil}).each do |p|
        menu[p] ||= Array.new
        menu[p].concat(Page.where(parent: p.title, visible: true))
      end
    end
  end

  def active_user_dashboard
    if user_signed_in?
      return send(current_user.role.to_s << "_dashboard_path")
    else
      raise "User has no role asigned, please contact administrator."
    end
  end

  def show_promos?
    controller.controller_name == 'pages' && controller.action_name == 'show'
  end

  def weekday_options
    [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday].collect { |day| [day.to_s.titleize, day] }
  end

  def add_new_button(link_path, content)
    render :partial => 'shared/add_new_button', :locals => { path: link_path, content: content }
  end

  def home?
    show_promos? && params[:permalink] == 'home'
  end

  def scrub string
    require 'iconv'
    ic = ::Iconv.new('UTF-8//IGNORE', 'UTF-8')
    ic.iconv(string + ' ')[0..-2]
  end
end
