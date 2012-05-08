Citychurch::Application.routes.draw do

  devise_for :users
  User.roles.each do |r|
    match "#{r.to_s}/dashboard" => "#{r.to_s.pluralize}#dashboard", :as => (r.to_s << "_dashboard").to_s
  end

  resources :pages
  resources :resources
  resources :images
  resources :banners, :only => [:new, :create, :destroy]

  match 'admin' => 'admin#index', :as => :admin
  match 'resources' => 'resource#index', :as => :resources

  match ':permalink' => 'pages#show', :as => :permalink

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#show', :permalink => 'home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
