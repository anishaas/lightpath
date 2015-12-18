class TeacherDashboardController < ApplicationController
  before_filter :authenticate_user

  def index
    @courses = current_user.courses
    @assignments = Assignment.where(graded: false)
  end

  def top_lightbulbs
  lightbulb_id_one = Message.where(lightbulb_id: all_lightbulb_ids_array[0])
  length1 = array1.length
  lightbulb_id_two = Message.where(lightbulb_id: all_lightbulb_ids_array[1])
  length2 = array2.length
  lightbulb_id_three = Message.where(lightbulb_id: all_lightbulb_ids_array[2])
  length3 = array3.length

  #Whichever lenght is biggest
  #lightbulb_id_one[0].lightbulb.summary (#get the lightbulb with id from message object and return info about that lightbulb object)

  end
end
