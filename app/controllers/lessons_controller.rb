class LessonsController < ApplicationController
  before_action :set_course, only: [:index, :show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @lessons = @course.lessons
  end

end
