Rails.application.routes.draw do
  root to: 'system#index'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/register' => 'user#new'
  post '/users' => 'user#create'
end
