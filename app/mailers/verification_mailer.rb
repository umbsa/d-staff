class VerificationMailer < ApplicationMailer
  default from: ENV["EMAIL_TO_USER_ADDRESS"]

  def email_to_users(user,reservation,staff)
    @user = user
    @reservation = reservation
    @staff = staff
    mail(to: @user.email, subject: 'ご予約が確定いたしました')
  end
end
