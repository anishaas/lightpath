class WebliographyentriesController < ActionController::Base
  before_action :set_course, only: [:post_to_api]
  def post_to_api
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
    service.request("POST","/courses/12288063/webliographyEntries",     {  "webliographyEntry":{
        "title": params["lightbulb"][:summary],
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
    @lightbulb = Lightbulb.create(student_id: @current_user.id, summary: params["lightbulb"][:summary],
    video_url: params["lightbulb"][:video_url], article_url: params["lightbulb"][:video_url])
    render 'post_to_api'
  end

end
