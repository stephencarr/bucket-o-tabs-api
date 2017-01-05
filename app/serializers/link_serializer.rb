class LinkSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :image_fav, :image_og, :description, :title, :url
  def description
    object.description.truncate(140)
  end
end
