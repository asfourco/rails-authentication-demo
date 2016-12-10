Rails.application.routes.draw do
  root to: 'system#index'
  
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create', as: :login_post
  get '/logout' => 'sessions#destroy', as: :logout
  
  get '/register' => 'user#new', as: :register
  post '/users' => 'user#create'
end
