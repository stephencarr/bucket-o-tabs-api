class Link < ApplicationRecord
  serialize :images, JSON   # Store images array as JSON in the database
  validates :url, presence: true, :format => URI::regexp(%w(http https))
  after_create :scrape_meta

  def scrape_meta
    LinkGenerateMetaJob.perform_now(url)
  end
end
