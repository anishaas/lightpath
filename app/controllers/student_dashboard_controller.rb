class StudentDashboardController < ApplicationController
  before_filter :authenticate_user
  def index
    @courses = current_user.courses
    @submissions = current_user.submissions
    # @graded_submissions = current_user.submissions.where(graded: true)
  end
end
