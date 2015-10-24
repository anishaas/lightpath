class AddStudentIdToLightbulb < ActiveRecord::Migration
  def change
    add_column :lightbulbs, :student_id, :integer
  end
end
