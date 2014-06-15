class Emailer < ActionMailer::Base
  default from: "volonter.rs@gmail.com"

 def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: 'petar.ivacic@gmail.com', subject: 'Welcome to My Awesome Site')
  end

end
