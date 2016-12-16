class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.text :title
      t.string :image_url
      t.string :url, :unique => true
      t.string :digest

      t.timestamps
    end
  end
end
