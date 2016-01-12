class SessionsController < ApplicationController
	def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    sign_in(user)
	  # render :text => "Welcome, #{current_user.name}."
    redirect_to root_url
	end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_url
  end
end