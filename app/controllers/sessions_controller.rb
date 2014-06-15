class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_url, :notice => 'Uspesno ste se izlogovali'
  end
end
