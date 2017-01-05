class LinkSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :image_fav, :image_og, :description, :title, :url, :url_host
  def description
    object.description&.truncate(140)
  end
  def url_host
    URI(object.url).host
  end
end
