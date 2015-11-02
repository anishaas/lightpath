class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :lightbulbs
  has_one :submissions
end
