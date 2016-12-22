class LinkSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description, :image_fav, :image_og, :title, :url
end
