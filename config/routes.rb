Rails.application.routes.draw do

  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  get 'pages/index'
  root 'pages#index'
  get 'pages/help'
  get "topics/index" => "topics#index"
  get "topics/:id" => "topics#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :topics
  resources :comments
  # get 'comments/new/:topic_id' => 'comments#new'

  get 'favorites/index'
  get '/favorites', to: 'favorites#index'
  post '/favorites', to: 'favorites#create'
  post "favorites/:topic_id/create" => "favorites#create"
  post "favorites/:topic_id/destroy" => "favorites#destroy"
  get "topics/:id/edit" => "topics#edit"
  post "topics/:id/update" => "topics#update"
  post "topics/:id/destroy" => "topics#destroy"

  get 'comments/index'
  get 'comments/new'

  get "users/:id/favorites" => "users#favorites"
  get "users/id" => "users#show"
end
