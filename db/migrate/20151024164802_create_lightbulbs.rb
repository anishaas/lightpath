class CreateLightbulbs < ActiveRecord::Migration
  def change
    create_table :lightbulbs do |t|
      t.string :summary
      t.string :video_url
      t.string :article_url
      t.string :other
      t.timestamps null: false
    end
  end
end
