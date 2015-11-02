class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :assignment_id
      t.string :body
    end
  end
end
