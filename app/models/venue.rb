class Venue < ActiveRecord::Base

  has_many :events, dependent: :destroy

  mount_uploader :venue_picture, VenuePictureUploader

  geocoded_by :venue_location
  after_validation :geocode

  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true

  protected
    def venue_location
      [address, city, province, country].compact.join(', ')
    end

end
