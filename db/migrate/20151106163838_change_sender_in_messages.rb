class ChangeSenderInMessages < ActiveRecord::Migration
  def change
    change_column :messages, :sender, 'integer USING CAST(sender AS integer)'
    change_column :messages, :receiver, 'integer USING CAST(sender AS integer)'
  end
end
