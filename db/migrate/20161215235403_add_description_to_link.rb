class AddDescriptionToLink < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :description, :text
  end
end
