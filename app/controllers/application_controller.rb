class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def homepage
  render '/layouts/home.html.erb'
end

def authenticate_user #This method needs to check that
  unless user_logged_in?
    redirect_to new_login_path
  end
end

def current_user
  if user_logged_in?
    current_user = User.find(session[:logged_in_users_id])
    return current_user
  end
end

def user_logged_in?
  session[:logged_in_users_id].present?
end

helper_method :user_logged_in? #helper methods for use in views
helper_method :current_user
end
