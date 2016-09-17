Rails.application.routes.draw do
 devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
 
 resources :projects do
 	resources :comments
 	resource :project_users
 	resources :notices
 	post "/like", to: "likes#like_toggle"
 	get "/joined", to: "projects#joined"
 	resources :results
 end
 resources :results do
 	resources :remarks
 	post "/thumbsup", to: "thumbsups#thumbsup_toggle"
 end


 root 'projects#index'
end
