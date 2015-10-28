class ChangeColumnsInTeachers < ActiveRecord::Migration
  def change
    change_column :teachers, :first_name, :string, :null => true
    change_column :teachers, :last_name, :string, :null => true
    change_column :teachers, :username, :string, :null => true
  end
end
