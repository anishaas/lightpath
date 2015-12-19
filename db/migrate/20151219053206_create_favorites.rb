class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :student_id, null: false
      t.integer :lightbulb_id, null: false
    end
  end
end
