class SessionsController < ApplicationController
	def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    sign_in(user)
    redirect_to root_url
	end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_url
  end
end