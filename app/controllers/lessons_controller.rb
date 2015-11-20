class LessonsController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @lessons = Course.find(params[:course_id]).lessons
  end

end
