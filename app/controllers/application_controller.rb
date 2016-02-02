class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
require 'learning_studio_authentication'
require 'learning_studio_core'
require 'JSON'
# require 'httparty'

def homepage
  render '/layouts/home.html.erb'
end

def about
  @content = JSON.parse(@content.content)
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

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    #ENV Variables not working
    # conf = LearningStudioAuthentication::Config::OAuthConfig.new({
    #     :application_id   => 'c5b8742f-c459-4fc2-91a1-7ee542acb214',
    #     :application_name => 'Lightpath',
    #     :client_string    => 'gbtestc',
    #     :consumer_key     => '4d2b474e-7b70-4b7e-aff5-7313567c2c38',
    #     :consumer_secret  =>  'DmyLEZn8ts7MuOUm'
    # })
    # oauth_factory = LearningStudioAuthentication::Service::OAuthServiceFactory.new(conf)
    # service = LearningStudioCore::BasicService.new(oauth_factory)
    # service.use_oauth2('anisha.srivastava123.student@gmail.com','msuTooEg')
    # service.data_format = LearningStudioCore::BasicService::DataFormat::JSON
    # @courses = service.request("GET","/me/courses?expand=course")
    # @course_title = JSON.parse(@courses.content)["courses"].first.first.last.first["course"]["displayCourseCode"]
    @course = Course.find(1)
  end
