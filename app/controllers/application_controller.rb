
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
  @response = service.request("GET","/courses/12288063/webliographyEntries")

  @currentuser = service.request("GET","/users/38619307")
  @currentuser_firstName = JSON.parse(@currentuser.content)["users"].first["firstName"]
  @assignments = service.request("GET", "/users/38619307/courses/12288063/itemHierarchy?expand=item")
  @assignments = JSON.parse(@assignments.content)["itemHierarchy"]

  # @assignments.sort_by {|assignment| assignment["childItemNodes"]}
  # @childitemnodes = Array.new
  # @assignments.each do |assignment|
  #     @childitemnodes.push(assignment["childItemNodes"])
  #   end
  # @response = service.request("GET","/courses/12288063/webliographyEntries")
  # response = JSON.parse(@response.content)["webliographyEntries"]
  # response = response.sort_by{|response|response["title"]}
  # @lightbulbs = Array.new
  # response.each do |response|
  #     @lightbulbs.push(response["title"], response["description"], response["url"], response["submitter"]["firstName"])
  #   end
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
  # @assignments = service.request("GET", "/users/38619307/courses/12288063/itemHierarchy?expand=item")
  # JSON.parse(@assignments.content)["itemHierarchy"]
  #
  # assignments = JSON.parse(@assignments.content)
  # @response = service.request("GET","/courses/12288063/webliographyEntries")

  # @assignments = JSON.parse(@assignments.content)["itemHierarchy"]["childItemNodes"].first["links"].first["item"]
  # @assignments.sort_by {|assignment| assignment["title"]}
  # @assignment_headers = Array.new
  # @assignment_titles = Array.new
  # @assignments.each do |assignment|
  #     @assignment_titles.push(assignment["title"])
  #   end


# @wb_post_response = service.request("POST","/courses/12288063/webliographyEntries", {
#     :webliographyEntry => {
#       :title => "TEST TITLE",
#       :description => "TEST DESCRIPTION",
#       :site => {:url => "www.youtube.com"},
#       :submitter =>{:userId => 38619307},
#       :category => {:id => 11380945},
#   }
# }.to_json)

# responseone = service.request("GET","/users/38619307")
# @response_id = JSON.parse(responseone.content)["users"].first["id"]
# @response_userName = JSON.parse(responseone.content)["users"].first["userName"]
# @response_firstName = JSON.parse(responseone.content)["users"].first["firstName"]
# @response_lastName = JSON.parse(responseone.content)["users"].first["lastName"]
#
@response = service.request("GET","/courses/12288063/webliographyEntries")
@response_title = JSON.parse(@response.content)["webliographyEntries"].first["title"]
@response_description = JSON.parse(@response.content)["webliographyEntries"].first["description"]
@response_site = JSON.parse(@response.content)["webliographyEntries"].first["site"]["url"]
@response_submitter = JSON.parse(@response.content)["webliographyEntries"].first["submitter"]["firstName"]

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
    @currentuser = service.request("GET", "/users/38619307")
    @current_user_firstName = JSON.parse(@currentuser.content)["users"].first["firstName"]
    @current_user = Student.find_by("first_name LIKE ?", @current_user_firstName)
    @courses = service.request("GET","/me/courses?expand=course")
    @course_title = JSON.parse(@courses.content)["courses"].first.first.last.first["course"]["displayCourseCode"]
    @course = Course.find(6)
  end
