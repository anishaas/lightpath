class FavoritesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @favorites = Lightbulb.find(params[:lightbulb_id]).favorites
  end

end
