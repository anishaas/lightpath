class WebliographyentriesController < ActionController::Base
  before_action :set_course, only: [:post_to_api]
  def post_to_api
    @lesson = Lesson.find(params["lightbulb"][:lesson_id])
    conf = LearningStudioAuthentication::Config::OAuthConfig.new({
      :application_id   => 'c5b8742f-c459-4fc2-91a1-7ee542acb214',
      :application_name => 'Lightpath',
      :client_string    => 'gbtestc',
      :consumer_key     => '04b11650-b3bb-41d6-91a6-c19936aaf4e5',
      :consumer_secret  => 'DmyLEZn8ts7MuOUm'
    })
    oauth_factory = LearningStudioAuthentication::Service::OAuthServiceFactory.new(conf)
    service = LearningStudioCore::BasicService.new(oauth_factory)
    service.use_oauth2('anisha.srivastava123.student@gmail.com','msuTooEg')
    service.data_format = LearningStudioCore::BasicService::DataFormat::JSON
    service.request("POST","/courses/12288063/webliographyEntries", {  "webliographyEntry":{
        "title": @lesson.title,
        "description": params["lightbulb"][:summary],
        "site":{
          "url": params["lightbulb"][:video_url]
        },
        "submitter":{
          "userId": 38619307
        },
        "category":{
     "id": 11380945
    }
      }
    }.to_json)
    #seed new Lightbulb
    @lightbulb = Lightbulb.create(course_id: @course.id, lesson_id: params["lightbulb"][:lesson_id].to_i ,student_id: current_user.id, summary: params["lightbulb"][:summary],
    video_url: params["lightbulb"][:video_url], article_url: params["lightbulb"][:article_url])
    redirect_to course_path(@course)
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
