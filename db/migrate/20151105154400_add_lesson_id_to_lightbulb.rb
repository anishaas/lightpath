class AddLessonIdToLightbulb < ActiveRecord::Migration
  def change
      add_column :lightbulbs, :lesson_id, :integer
  end
end
