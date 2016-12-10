class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    begin
      if session[:user_id]
        @current_user = User.find(session[:user_id])
      end
    rescue
      flash[:danger] = 'Invalid session'
      @current_user = nil
    end
  end
  helper_method :current_user

  def authorize
    redirect_to login_path unless current_user
  end
end
