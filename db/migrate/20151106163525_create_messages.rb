class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender, :string, null: false
      t.string :receiver, :string, null: false
      t.string :body, :string, null: false
      t.string :subject, :string, null: false
    end
  end
end
