class AddAdminToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :admin, :boolean, default:true
  end
end
