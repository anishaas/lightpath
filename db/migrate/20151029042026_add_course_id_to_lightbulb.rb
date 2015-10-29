class AddCourseIdToLightbulb < ActiveRecord::Migration
  def change
    add_column :lightbulbs, :course_id, :integer
  end
end
