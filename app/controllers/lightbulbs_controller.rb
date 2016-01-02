class LightbulbsController < ApplicationController
  before_action :set_lightbulb, only: [:show, :edit, :update, :destroy]

  # GET /lightbulbs
  # GET /lightbulbs.json
  def index
    @lightbulbs = Lightbulb.all
  end

  # GET /lightbulbs/1
  # GET /lightbulbs/1.json
  def show
  end

  # GET /lightbulbs/new
  def new
  @lightbulb = Lightbulb.new
    #new lightbulb
  end
  # GET /lightbulbs/1/edit
  def edit
  end

  # POST /lightbulbs
  # POST /lightbulbs.json
  def create
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
          :title => :summary,
          :description => :summary,
          :site => {:url => :video_URL},
          :submitter =>{:userId => Student.find(5).id},
          :category => {:id => 11380945},
      }
    }.to_json)
    redirect_to :back
  end

  # PATCH/PUT /lightbulbs/1
  # PATCH/PUT /lightbulbs/1.json
  def update
    respond_to do |format|
      if @lightbulb.update(lightbulb_params)
        format.html { redirect_to @lightbulb, notice: 'Lightbulb was successfully updated.' }
        format.json { render :show, status: :ok, location: @lightbulb }
      else
        format.html { render :edit }
        format.json { render json: @lightbulb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lightbulbs/1
  # DELETE /lightbulbs/1.json
  def destroy
    @lightbulb.destroy
    respond_to do |format|
      format.html { redirect_to lightbulbs_url, notice: 'Lightbulb was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lightbulb
      @lightbulb = Lightbulb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lightbulb_params
      params.require(:lightbulb).permit(:assignment_id, :course_id, :student_id, :lesson_id, :summary, :video_url, :article_url, :other)
    end
end
