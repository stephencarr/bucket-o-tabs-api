class LinkGenerateMetaJob < ApplicationJob
  queue_as :default

  def perform(url)
    data = Grabbit.url(url)
    if data
        link = Link.find_by_url url
        link.title = data.title
        link.description = data.description
        link.images = data.images
        link.save!
    end
  end
end
