class RemoveStringFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :string
  end
end
