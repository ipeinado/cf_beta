class Event < ActiveRecord::Base

  belongs_to :venue
  accepts_nested_attributes_for :venue

  scope :future, -> { where('daytime > ?', Time.zone.now) }
  scope :future_ordered, -> { future.order(daytime: :asc) }

  scope :past, -> { where('daytime < ?', Time.zone.now)}
  scope :past_ordered, -> { past.order(daytime: :desc) }

  mount_uploader :event_header_picture, EventHeaderPictureUploader

  validates :venue_id, presence: true
  validates :title, presence: true
  validates :short_description, presence: true, length: { maximum: 255 }
  validates :daytime, presence: true

end
