class Venue < ActiveRecord::Base

  has_many :events, dependent: :destroy

  before_save :format_twitter

  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true

  def format_twitter
    self.twitter = "https://twitter.com/" + twitter if self.twitter?
  end
end
