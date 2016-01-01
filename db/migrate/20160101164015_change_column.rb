class ChangeColumn < ActiveRecord::Migration
  def change
    change_table :lessons do |t|
    t.change :number, :string
    end
  end
end
