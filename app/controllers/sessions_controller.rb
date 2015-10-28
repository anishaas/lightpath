class SessionsController < ApplicationController

def new #new login session
end

def create
  user = Student.find_by_username(params[:username])
  if user && user.authenticate(params[:password])
    set_user_session(user) #set session's user id to params passed in user
    redirect_to student_dashboard_path, notice: "Successfully Logged In. Welcome! #{current_user.first_name + current_user.last_name}"
  else
    flash[:alert] = "Login Credentials Invalid!"
    render :new #back to login page
  end
end

def destroy
  session[:logged_in_users_id] = nil
  redirect_to root_path, notice: 'Successfully Logged Out. See you next time!'
end

private #why is this private?

  def set_user_session(user)
    session[:logged_in_users_id] = user.id
  end
end
