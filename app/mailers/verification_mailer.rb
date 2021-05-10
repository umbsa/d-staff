class VerificationMailer < ApplicationMailer
  default from: ENV["EMAIL_TO_USER_ADDRESS"]

  def email_to_users(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
