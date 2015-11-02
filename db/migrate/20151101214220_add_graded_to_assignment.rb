class AddGradedToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :graded, :boolean, default: false
  end
end
