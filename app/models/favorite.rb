class Favorite < ActiveRecord::Base
  belongs_to :student
  belongs_to :lightbulb
end
