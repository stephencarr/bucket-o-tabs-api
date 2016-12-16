class FixLinkImageColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :links, :image_url, :images
  end
end
