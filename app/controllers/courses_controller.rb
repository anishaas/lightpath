
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
    @bulbs= current_user.lightbulbs.where(course_id: @course.id)
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
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :teacher_id, :description)
    end
end
