module AssetHelper
  def load_stylesheets
    stylesheets = ["application"]

    if Storefront::Application::assets.find_asset("#{File.join(controller_name, controller_name)}.css")
      stylesheets << File.join(controller_name, controller_name) #controller specific manifest
    end

    if Storefront::Application::assets.find_asset("#{File.join(controller_name, action_name)}.css")
      stylesheets << File.join(controller_name, action_name) #specific styles for action
    end

    stylesheets
  end

  def load_javascripts
    javascripts = ["application"]

    if home? && Citychurch::Application::assets.find_asset("#{File.join("ourcitychurch", "ourcitychurch")}.js")
      javascripts << File.join("ourcitychurch", "ourcitychurch") #if we're on the homepage include some extra stuff
    end

    if controller_name == "pages" && action_name == "show"
      page = params[:permalink].gsub('-', '_').pluralize
      javascripts << File.join(page, page) #manifest for specific pages javascript
    end

    if Citychurch::Application::assets.find_asset("#{File.join(controller_name, controller_name)}.js")
      javascripts << File.join(controller_name, controller_name) #controller specific manifest
    end

    if Citychurch::Application::assets.find_asset("#{File.join(controller_name, action_name)}.js")
      javascripts << File.join(controller_name, action_name) #specific styles for action
    end

    javascripts
  end
end
