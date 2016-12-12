class UserMailer < ApplicationMailer
  default from: 'Rails Authentication Demo <no-reply@rails-authentication-demo.herokuapp.com>'
  
  def registration_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Registration Confirmation')
  end
  
  def reset_password(user)
    @user = user
    @user.reset_password_email_sent_at = DateTime.now
    @user.save
    mail(to: @user.email, subject: 'Password reset')
  end
end
