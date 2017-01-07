class Link < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  serialize :images, JSON   # Store images array as JSON in the database
  validates :url, presence: true, :format => URI::regexp(%w(http https))
  after_create :scrape_meta
  # TODO make related table to connect Link with User using soft-deletes (paranoia) on UserLinks
  # TODO make clean-up job to remove any orphan Links
  has_attached_file :image_fav, default_url: ""
  has_attached_file :image_og, default_url: ""
  # Validate content type
  validates_attachment_content_type :image_fav, content_type: [/\Aimage/, /\Aoctet\-stream/]
  validates_attachment_content_type :image_og, content_type: [/\Aimage/, /\Aoctet\-stream/]
  # TODO Fix content spoofing
  def scrape_meta
    LinkGenerateMetaJob.perform_now(id)
  end
end
