class TeacherDashboardController < ApplicationController
  before_filter :authenticate_user
  def index
    @courses = current_user.courses
    @assignments = Assignment.where(graded: false)
  end
end
