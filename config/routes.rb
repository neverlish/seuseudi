Rails.application.routes.draw do
 devise_for :users
 
 resources :projects do
 	resources :comments
 	resource :project_users
 	post "/like", to: "likes#like_toggle"
 end


 root 'projects#index'
end
