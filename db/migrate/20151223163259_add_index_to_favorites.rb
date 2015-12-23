class AddIndexToFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, [:lightbulb_id, :student_id], unique: true
  end
end
