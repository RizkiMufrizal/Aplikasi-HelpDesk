class UserNotification < ApplicationMailer

  def send_verification_email(user)
    @user = user
    mail(:to => @user.email, :subject => 'Verifikasi Email')
  end

end
