class LessonsController < ApplicationController
  before_action :set_course, only: [:index, :show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @lessons = @course.lessons
    @lesson_options = Lesson.where(course_id:6).all.map{|l| [ l.title, l.id ] }
  end

  def show
    @id = params.fetch(:id)
  end

end
