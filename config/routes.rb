Rails.application.routes.draw do
  devise_for :userbundles
  get 'topics/index'
  # get 'topics/new' 20191013に削除
  get 'sessions/new'
  # get 'users/new'
  root 'pages#index'
  get 'pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
end
