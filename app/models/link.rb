class Link < ApplicationRecord
  serialize :images, JSON   # Store images array as JSON in the database
  validates :url, presence: true, :format => URI::regexp(%w(http https))
  after_create :scrape_meta
  # TODO make related table to connect Link with User using soft-deletes (paranoia) on UserLinks
  # TODO make clean-up job to remove any orphan Links
  def scrape_meta
    LinkGenerateMetaJob.perform_now(url)
  end
end
