
class CoursesController < ApplicationController
  before_action :set_course, only: [:send_lightbulb, :search, :show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json

  def search
    #get assignments for the course page user is on
    @q = "%#{params[:query]}%".downcase.strip
    @assignments = Assignment.where("lower(title) LIKE ?", @q)
    @results = @assignments
    @results += Lesson.where("lower(title) || lower(description) LIKE ?", @q)
    @results += Lightbulb.where("lower(summary) || lower(video_url) LIKE ?", @q)
    @assignments
    @results
    @bulbs = current_user.lightbulbs.where(course_id: @course.id)
    render 'show'
  end

  def send_lightbulb
    @subject = "%#{params[:querysubject]}%".downcase.strip
    @qu = "%#{params[:queryclassmates]}%".downcase.strip
    @recipient = Student.find_by("lower(first_name) LIKE ?", @qu)
    @bulbs= current_user.lightbulbs.where(course_id: @course.id)
    render 'show'
    #Use on modal
  end
# Started working when I changed .where to .find_by
  def index
    @assignments
    @courses = Course.all
  end

  def show
    # @course = Course.fetch(params[:id])
    # @assignments = @course.assignments
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
    @courses = service.request("GET","/me/courses?expand=course")
    @course_title = JSON.parse(@courses.content)["courses"].first.first.last.first["course"]["displayCourseCode"]
    @course = Course.find_by("name LIKE ?", @course_title)
    @lessons = @course.lessons
    @response_array = service.request("GET","/courses/12288063/webliographyEntries")
    response = JSON.parse(@response_array.content)["webliographyEntries"]
    response = response.sort_by{|response|response["title"]}
    @lightbulbs = Array.new
    response.each do |response|
        @lightbulbs.push(response["title"], response["description"], response["url"], response["submitter"]["firstName"])
      end
    @bulbs = Array.new
    @bulbs= @current_user.lightbulbs.where(course_id: @course.id)
    @recipient = Student.find_by("lower(first_name) LIKE ?", @qu)
  end

  # GET /courses/1
  # GET /courses/1.json

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
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
      @course = Course.find_by("name LIKE ?", @course_title)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :teacher_id, :description)
    end
end
