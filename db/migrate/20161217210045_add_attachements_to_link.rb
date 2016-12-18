class AddAttachementsToLink < ActiveRecord::Migration[5.0]
  def self.up
      add_attachment :links, :image_og
      add_attachment :links, :image_fav
    end

    def self.down
      remove_attachment :links, :image_og
      remove_attachment :links, :image_fav
    end
end
