class AddEnrollmentIdToLightbulb < ActiveRecord::Migration
  def change
    add_column :lightbulbs, :enrollment_id, :integer
  end
end
