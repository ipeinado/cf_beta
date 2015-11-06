class Venue < ActiveRecord::Base
  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
