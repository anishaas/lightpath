class StudentDashboardController < ApplicationController
  before_filter :authenticate_user

  def index
    @courses = current_user.courses
    @submissions = current_user.submissions
    @messages = current_user.received_messages
    # @lightbulb_ids = current_user.lightbulbs.map{|lightbulb|lightbulb.id}
    @displayfavorites = Array.new
    @favoritesall = Favorite.all
    @favoritesall.each do |favorite|
    if favorite.lightbulb.student.id == current_user.id #add to display array
      @displayfavorites.push(favorite)
      end
    end
    # @graded_submissions = current_user.submissions.where(graded: true)
  end
end
