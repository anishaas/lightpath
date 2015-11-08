class StudentDashboardController < ApplicationController
  before_filter :authenticate_user
  def index
    @courses = current_user.courses
    @submissions = current_user.submissions
    @messages = current_user.received_messages
    # @graded_submissions = current_user.submissions.where(graded: true)
  end
end
