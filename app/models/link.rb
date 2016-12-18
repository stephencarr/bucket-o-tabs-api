class Link < ApplicationRecord
  serialize :images, JSON   # Store images array as JSON in the database
  validates :url, presence: true, :format => URI::regexp(%w(http https))
  after_create :scrape_meta
  # TODO make related table to connect Link with User using soft-deletes (paranoia) on UserLinks
  # TODO make clean-up job to remove any orphan Links
  has_attached_file :image_fav
  has_attached_file :image_og
  # Validate content type
  validates_attachment_content_type :image_fav, content_type: /\Aimage/
  validates_attachment_content_type :image_og, content_type: /\Aimage/
  def scrape_meta
    LinkGenerateMetaJob.perform_now(url)
  end
end
