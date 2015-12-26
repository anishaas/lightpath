
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
require 'learning_studio_authentication'
require 'learning_studio_core'
require 'JSON'
# require 'httparty'

def homepage
conf = LearningStudioAuthentication::Config::OAuthConfig.new({
    :application_id   => 'c5b8742f-c459-4fc2-91a1-7ee542acb214',
    :application_name => 'Lightpath',
    :client_string    => 'gbtestc',
    :consumer_key     => '4d2b474e-7b70-4b7e-aff5-7313567c2c38',
    :consumer_secret  =>  'DmyLEZn8ts7MuOUm'
})
oauth_factory = LearningStudioAuthentication::Service::OAuthServiceFactory.new(conf)
service = LearningStudioCore::BasicService.new(oauth_factory)
service.use_oauth2('anisha.srivastava123.student@gmail.com','msuTooEg')
service.data_format = LearningStudioCore::BasicService::DataFormat::JSON
responseone = service.request("GET","/users/38619307")
@response_id = JSON.parse(responseone.content)["users"].first["id"]
@response_userName = JSON.parse(responseone.content)["users"].first["userName"]
@response_firstName = JSON.parse(responseone.content)["users"].first["firstName"]
@response_lastName = JSON.parse(responseone.content)["users"].first["lastName"]

responsetwo = service.request("GET","/me/courses")
@response_course_title = JSON.parse(responsetwo.content)["courses"].first["links"].first["title"]

@response = service.request("GET","/courses/12288063/webliographyEntries")
# @response_title = JSON.parse(@response.content)["webliographyEntries"].first["title"]
@response_description = JSON.parse(@response.content)["webliographyEntries"].first["description"]
@response_site = JSON.parse(@response.content)["webliographyEntries"].first["site"]["url"]
@response_submitter = JSON.parse(@response.content)["webliographyEntries"].first["submitter"]["firstName"]
render '/layouts/home.html.erb'
#Test this API call to get access token
# @api_response = POST "https://api.learningstudio.com/token"
# Content-Type: application/x-www-form-urlencoded
# grant_type=password&amp;client_id=c5b8742f-c459-4fc2-91a1-7ee542acb214&amp;username=gbtestc\anisha.srivastava123.student@gmail.com&amp;password=msuTooEg
#API call to retrieve logged in user's courses
#API call to retrieve logged in user's classmates (their lightbulbs are accessible)
#enrolledUsers = /courses/{courseId}/enrolledUsers
#classmates = /users/{userId}/classmates
#/courses/{courseId}/enrolledUsers
#API Call to retrieve course's information for course show page
#get instructor /courses/{courseId}/instructors
#API call to retrieve assignments for a course
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
