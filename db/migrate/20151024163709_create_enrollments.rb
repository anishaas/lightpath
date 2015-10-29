class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :student_id, null:false
      t.integer :course_id, null:false
    end
  end
end
