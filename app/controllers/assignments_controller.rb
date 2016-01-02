class AssignmentsController < ApplicationController
  before_action :set_course, only: [:index, :show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
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
    @response_items = service.request("GET","/users/38619307/courses/12288063/items/home/items")
    @item_title = JSON.parse(@response_items.content)["items"].first["title"]
    @item_description = JSON.parse(@response_items.content)["items"].first["description"]
    @item_title_two = JSON.parse(@response_items.content)["items"].last["title"]
    @assignmentone = Course.find(params[:course_id]).assignments.first
    @lightbulb = Lightbulb.new
    @assignments = @course.assignments

  end

end
