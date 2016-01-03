class StudentDashboardController < ApplicationController
  before_filter :authenticate_user

  def index
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
    @currentuser = service.request("GET","/users/38619307")
    @currentuser_firstName = JSON.parse(@currentuser.content)["users"].first["firstName"]
    @courses = service.request("GET","/me/courses?expand=course")
    @course_title = JSON.parse(@courses.content)["courses"].first.first.last.first["course"]["displayCourseCode"]
    @course = Course.find(1)
    # @courses = current_user.courses
    # @submissions = current_user.submissions
    # @messages = current_user.received_messages
    # @lightbulb_ids = current_user.lightbulbs.map{|lightbulb|lightbulb.id}
    @displayfavorites = Array.new
    @favoritesall = Favorite.all
    @favoritesall.each do |favorite|
    if favorite.lightbulb.student.id == current_user.id #add to display array
      @displayfavorites.push(favorite)
      end
    end
    # @graded_submissions = current_user.submissions.where(graded: true)
  end
end
