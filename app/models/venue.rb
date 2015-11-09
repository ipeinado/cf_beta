class Venue < ActiveRecord::Base

  has_many :events, dependent: :destroy

  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
