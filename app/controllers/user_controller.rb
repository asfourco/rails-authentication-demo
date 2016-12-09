class UserController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to controller: 'system', action: 'index'
    else
      redirect_to action: 'new'
    end
  end
end
