class SessionsController < ApplicationController

  def new
  end

  def create
    now = DateTime.now.utc.to_s(:db)
    user = User.find_by(email: params[:email])
    if user 
      if user.authenticate(params[:password])
        user.last_login = now
        user.save

        session[:user_id] = user.id
        redirect_to cat_path
      else
        user.last_failed_login = now
        user.failed_login_count += 1

        user.save
        invalidLoginResponse
      end
    else
      invalidLoginResponse
    end
  end

  def destroy
    # session[:user_id] = nil
    reset_session
    redirect_to root_path
  end

  private
    def invalidLoginResponse
      flash[:danger] = 'Invalid username and/or password'
      redirect_to login_path
    end
end
