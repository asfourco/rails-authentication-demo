class PasswordController < ApplicationController
  def new
  end

  def reset
    user = User.find_by(email: params[:email])
    if user
      user.reset_token
      UserMailer.reset_password(user).deliver
      redirect_to root_path
    end
  end
  
  # reset password directed here from user reset password email
  def edit
    now = DateTime.now
    @token = params[:token]
    @user = User.find_by(reset_password_token: @token)
    # if there is no such token or it has expired then go back to root
    if @user.blank? || (@user.reset_password_token_expires_at < now)
      flash[:danger] = 'Invalid token'
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by(reset_password_token: params[:token])
    @user = User.update(@user.id, reset_params)
    if @user.save
      @user.deactivate_reset_password
      flash[:success] = 'You have successfully reset your password. Please login'
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  private

    def reset_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
