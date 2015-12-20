
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#These requires return the error 'cannot load such file' when running the app on local server
# require 'rubygems'
require 'learning_studio_authentication/lib/learning_studio_authentication'
require 'learning_studio_core'

def homepage
#Test API call, returns error because of no Access Key, not sure of struture for that
# Issue the request and return the response.
render '/layouts/home.html.erb'
end

def about
  render '/layouts/about.html.erb'
end

def authenticate_user
  unless user_logged_in? #User would not be able to log in if invalid
    redirect_to new_login_path
  end
end

def current_user #setting current user to user in session(logged in user)
  if user_logged_in?
    Student.find(session[:logged_in_users_id])
  end
end

  def user_logged_in?
    session[:logged_in_users_id].present?
  end

  helper_method :user_logged_in?
  helper_method :current_user
end
