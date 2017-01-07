class LinkGenerateMetaJob < ApplicationJob
  queue_as :default
  # TODO scrape beta meta
  def perform(id)
    link = Link.find id
    begin
      data = OpenGraph.new(link.url)
      if data
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
    rescue
      logger.debug "Link failed to fetch: #{link.url}"
    end
  end
end
