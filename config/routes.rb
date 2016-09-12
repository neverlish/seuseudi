Rails.application.routes.draw do
 devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
 
 resources :projects do
 	resources :comments
 	resource :project_users
 	post "/like", to: "likes#like_toggle"
 end


 root 'projects#index'
end
