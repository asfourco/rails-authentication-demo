class UserController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = 'Registration successful'
      redirect_to root_path
    else
      flash[:danger] = 'Error in user registration form, please try again'
      redirect_to action: 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
