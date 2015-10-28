class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to root_path unless current_user
  end

  def index
    @courses = current_user.courses
  end
end
