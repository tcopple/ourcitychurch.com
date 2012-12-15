Citychurch::Application.routes.draw do

  devise_for :users
  User.roles.each do |r|
    match "#{r.to_s}/dashboard" => "#{r.to_s.pluralize}#dashboard", :as => ("#{r.to_s}_dashboard").to_s
  end

  resources :pages
  get 'pages/:id/swap/:other' => 'pages#swap_order', :as => :swap_pages

  resources :resources
  resources :images
  resources :banners, :only => [:new, :create, :destroy]
  resources :community_groups
  resources :community_group_leaders

  match 'resources' => 'resource#index', :as => :resources
  match ':permalink' => 'pages#show', :as => :permalink

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#show', :permalink => 'home'
end
