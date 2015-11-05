class Lightbulb < ActiveRecord::Base
  belongs_to :enrollment
  belongs_to :student
  belongs_to :assignment
  belongs_to :submission #check if needed
  belongs_to :course
  belongs_to :lesson
end
