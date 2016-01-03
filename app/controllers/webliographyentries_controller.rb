class WebliographyentriesController < ActionController::Base

  def post_to_api
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
    service.request("POST","/courses/12288063/webliographyEntries", {
        :webliographyEntry => {
          :title => params[:summary],
          :description => params[:summary],
          :site => params[:aricle_url],
          :submitter => params[:video_url],
          :category => 11380945,
      }
    })
    #sent here with form params
    render 'post_to_api'
  end

end
