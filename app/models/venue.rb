class Venue < ActiveRecord::Base

  has_many :events

  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
