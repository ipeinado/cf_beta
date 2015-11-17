class Venue < ActiveRecord::Base

  has_many :events, dependent: :destroy

  mount_uploader :venue_picture, VenuePictureUploader

  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true

end
