class LinkGenerateMetaJob < ApplicationJob
  queue_as :default
  # TODO scrape beta meta
  def perform(url)
    data = OpenGraph.new(url)
    # TODO transload image to AWS bucket
    if data
        link = Link.find_by_url url
        link.description = data.description
        link.images = data.images
        link.title = data.title
        link.url = data.url
        link.images.each do | key, value |
          begin
            link.send("image_#{key}=".to_sym, URI.parse(value)) unless value.blank?
            link.save
          rescue StandardError => e
            # log "LinkGenerateMetaJob: #{e.message}"
          end
        end
        link.save!
    end
  end
end
