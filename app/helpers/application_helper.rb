module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new({:hard_wrap => false, :fitler_html => true})
    markdown = Redcarpet::Markdown.new(renderer, {:no_intra_emphasis => true, :autolink => true})
    markdown.render(text).html_safe
  end

  def build_menu_hash
    Hash.new.tap do |menu|
      Page.where(:parent => nil, :visible => true).each do |p|
        menu[p] ||= Array.new
        menu[p].concat(Page.where(parent: p.title))
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

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def bootstrapped_field(builder, obj, input_type, field, *opts)
    render :partial => 'shared/form_field', :locals => { builder: builder, type: input_type, object: obj, field: field, opts: opts }
  end
end
