class StudentDashboardController < ApplicationController
  before_filter :authenticate_user
  require '../config/oauth.yml'
  require_relative '../learning_studio_authentication-0.0.1.gem'
  require_relative '../learning_studio_core-0.0.1.gem'

  def index
    @courses = current_user.courses
    @submissions = current_user.submissions
    @messages = current_user.received_messages
    # @graded_submissions = current_user.submissions.where(graded: true)
  end
end
