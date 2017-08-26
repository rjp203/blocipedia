class WelcomeMailer < ApplicationMailer
  default from: 'rjp203@gmail.com'
  
  def welcome_send(user)
    @user = user
    mail(to: user.email, subject: "Thank you from Blocipedia!")
  end
  
end
