class Event < ActiveRecord::Base

  belongs_to :venue

  scope :future, -> { where('daytime > ?', Time.zone.now) }
  scope :future_ordered, -> { future.order(daytime: :asc) }

  scope :past, -> { where('daytime < ?', Time.zone.now)}
  scope :past_ordered, -> { past.order(daytime: :desc) }

  validates :title, presence: true
  validates :short_description, presence: true, length: { maximum: 255 }
  validates :daytime, presence: true

end
