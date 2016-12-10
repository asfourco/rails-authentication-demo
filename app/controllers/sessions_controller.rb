class SessionsController < ApplicationController
  def new
  end

  def create
    begin
      user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    rescue
      flash[:danger] = 'Inalid Username and/or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
