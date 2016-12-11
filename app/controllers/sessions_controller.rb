class SessionsController < ApplicationController
  def new
  end

  def create
    now = DateTime.now.utc.to_s(:db)
    user = User.find_by(email: params[:email])
    isUserValid(user)
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
    
    def isUserValid(user)
      if user
        isUserAuthenticated(user)
      else
        invalidLoginResponse
      end
    end
    
    def isUserAuthenticated(user)
      now = DateTime.now.utc.to_s(:db)
      if user.authenticate(params[:password])
        isUserConfirmed(user)
      else
        user.last_failed_login = now
        user.failed_login_count += 1

        user.save
        invalidLoginResponse
      end
    end
    
    def isUserConfirmed(user)
      now = DateTime.now.utc.to_s(:db)
      if user.email_confirmed
        user.last_login = now
        user.save

        session[:user_id] = user.id
        redirect_to cat_path
      else
        flash[:warning] = 'Please activate your account'
        redirect_to root_path
      end
    end
end
