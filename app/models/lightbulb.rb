class Lightbulb < ActiveRecord::Base
  belongs_to :enrollment
  belongs_to :student
  belongs_to :assignment
  belongs_to :course
end
