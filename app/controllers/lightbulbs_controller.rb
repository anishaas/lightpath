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
    #new lightbulb moment
    @new_lightbulb =  HTTParty.post('https://api.learningstudio.com/courses/12288063/webliographyEntries',
    :headers => { "X-Authorization" => "Access_Token access_token=c5b8742f-c459-4fc2-91a1-7ee542acb214|da3e64c4-05d1-44d6-bcf7-cac945f2fd6d|38619307|2015-12-24T06%3a44%3a56|e83dd39cd083801ba4597ec951fc3218"},
    :query => {:webliographyEntry => {:title => 'TEST TITLE', :description => 'TEST DESCRIPTION', :site => {:URL => 'www.youtube.com'}, :submitter => {:userId => 38619307}, :category => {:id => 11380945}})
  end

  # GET /lightbulbs/1/edit
  def edit
  end

  # POST /lightbulbs
  # POST /lightbulbs.json
  def create
    @lightbulb = Lightbulb.new(lightbulb_params)
    @lightbulb.student_id == current_user.id
    respond_to do |format|
      if @lightbulb.save
        format.html { redirect_to @lightbulb, notice: 'Lightbulb was successfully created.' }
        format.json { render :show, status: :created, location: @lightbulb }
      else
        format.html { render :new }
        format.json { render json: @lightbulb.errors, status: :unprocessable_entity }
      end
    end
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
