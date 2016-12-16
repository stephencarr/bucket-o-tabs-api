class FixLinkImageColumnType < ActiveRecord::Migration[5.0]
  def up
    change_column :links, :images, :json
  end
  def down
    change_column :links, :images, :string
  end
end
