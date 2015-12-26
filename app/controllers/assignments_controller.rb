class AssignmentsController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @assignments = Course.find(params[:course_id]).assignments
    @assignmentone = Course.find(params[:course_id]).assignments.first
    @lightbulb = Lightbulb.new
  end

end
