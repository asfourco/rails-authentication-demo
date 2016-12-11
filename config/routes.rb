Rails.application.routes.draw do
  root to: 'system#index'
  # session login/logout routes
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create', as: :login_post
  get '/logout' => 'sessions#destroy', as: :logout
  # registration routes
  get '/register' => 'user#new', as: :register
  post '/user' => 'user#create', as: :user_create
  get '/user' => 'user#new'
  get '/user/:token/confirm_email' => 'user#confirm_email', as: :confirm_email_user
  # password reset routes
  get '/user/reset' => 'password#new', as: :reset
  post '/user/reset' => 'password#reset', as: :reset_post
  get '/user/:token/new_password' => 'password#edit', as: :new_password_request
  put '/user/new_password.:token' => 'password#update', as: :update_password
  
  # after login routes
  get '/cat' => 'cat#show', as: :cat
end
