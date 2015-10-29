class AddAssignmentIdToLightbulb < ActiveRecord::Migration
  def change
    add_column :lightbulbs, :assignment_id, :string
  end
end
