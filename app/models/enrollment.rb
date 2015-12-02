class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  has_many :submissions
  has_many :lightbulbs
end
