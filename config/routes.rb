Rails.application.routes.draw do
 devise_for :users
 
 resources :projects do
 	resources :comments
 	post "/like", to: "likes#like_toggle"
 end


 root 'projects#index'
end
