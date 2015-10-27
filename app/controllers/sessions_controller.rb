class SessionsController < ApplicationController
skip_before_filter :authenticate_user

def new #login page
end

def create #new login session
  #find the user in params
  user = User.find_by_username(params[:username])
  if user.present? && user.authenticate(params[:password])
    set_session_user(user)
    redirect_to root_path, notice: "Successfully logged in!"
  else
    flash[:alert] = 'Username or Password did not match'
    render :new
  end
end

def destroy
  session[:logged_in_users_id] = nil
  redirect_to root_path, notice: "Successfully logged out."
end

private

def set_session_user(user)
  session[:logged_in_users_id] = user.id
end

end
