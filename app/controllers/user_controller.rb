class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = 'Please confirm your email address by clicking the link int the email we just sent you'
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def confirm_email
    user = User.find_by(confirm_token: params[:token])
    if user
      user.email_activate
      flash[:success] = 'Your account has been confirmed, please login to continue'
      redirect_to login_path
    else
      flash[:danger] = 'Apologies, but we can not confirm you account'
      redirect_to root_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
