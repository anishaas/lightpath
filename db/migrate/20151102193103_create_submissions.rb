class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :body
      t.belongs_to :student, index: true, foreign_key: true
      t.belongs_to :assignment, index: true, foreign_key: true
    end
  end
end
