Rails.application.routes.draw do


  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  get 'pages/indx'
  root 'pages#index'
  get 'pages/help'
  get "topics:id" => "topics#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :topics
  resources :comments



  get 'favorites/index'
  get '/favorites', to: 'favorites#index'
  post '/favorites', to: 'favorites#create'

  get 'comments/index'
  get 'comments/new'
  


end
