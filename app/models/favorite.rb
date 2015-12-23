class Favorite < ActiveRecord::Base
  belongs_to :student
  belongs_to :lightbulb
  validates :lightbulb_id, uniqueness: { scope: :student_id }
end
