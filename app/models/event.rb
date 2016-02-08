class Event < ActiveRecord::Base

  belongs_to :venue
  has_many :sponsorships, dependent: :destroy
  has_many :entities, through: :sponsorships, source: :sponsor, source_type: 'Entity'
  has_many :users, through: :sponsorships, source: :sponsor, source_type: 'User'

  accepts_nested_attributes_for :venue

  scope :future, -> { where('daytime > ?', Time.zone.now) }
  scope :future_ordered, -> { future.order(daytime: :asc) }

  scope :past, -> { where('daytime < ?', Time.zone.now)}
  scope :past_ordered, -> { past.order(daytime: :desc) }

  mount_uploader :event_header_picture, EventHeaderPictureUploader
  mount_uploader :event_body_picture, EventBodyPictureUploader

  acts_as_taggable
  acts_as_taggable_on :categories

  validates :venue_id, presence: true
  validates :title, presence: true
  validates :short_description, presence: true, length: { maximum: 255 }
  validates :daytime, presence: true

  def sponsors
    Sponsorship.where(event_id = self.id)
  end

end
