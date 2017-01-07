class LinkSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :image_fav, :image_og, :description, :title, :url, :url_host
  def description
    object.description&.truncate(140)
  end
  def image_fav
    object.image_fav.url(:thumbnail)
  end
  def image_og
    object.image_og.url(:thumbnail)
  end
  def url_host
    URI(object.url).host
  end
end
