class Course < ActiveRecord::Base
  belongs_to :teacher
  has_many :enrollments
  # has_many :students, through: :enrollments
  has_many :assignments
  has_many :lightbulbs
  has_many :lessons
end
