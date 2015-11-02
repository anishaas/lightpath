class StudentDashboardController < ApplicationController
  before_filter :authenticate_user
  def index
    @courses = current_user.courses
    # @graded_submissions = current_user.submissions.where(graded: true)
  end
end
