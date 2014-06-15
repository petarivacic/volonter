class EventsMailer < ActionMailer::Base
  default from: "Volonter RS"

 def create_event(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'VAZNO: Molimo Vas Potvrdite Akciju')
  end

end
