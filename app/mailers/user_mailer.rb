class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def password_recovery_email(user)
    @user = user
    @url = "http://localhost:3000/session/update_password?password_digest=#{@user.password_digest}"
    mail(:to => user.email, :subject => "Your new password")
  end

end
