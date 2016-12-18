class FixUrlColumnIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :links, :url
  end
end
