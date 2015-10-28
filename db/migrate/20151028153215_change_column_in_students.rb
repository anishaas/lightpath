class ChangeColumnInStudents < ActiveRecord::Migration
  def change
    change_column :students, :first_name, :string, :null => true
    change_column :students, :last_name, :string, :null => true
    change_column :students, :username, :string, :null => true
  end
end
