class Project < ActiveRecord::Base

  default_scope { where("longitude IS NOT NULL") }

  geocoded_by :project_location
  after_validation :geocode

  before_save :valid_address?

  validates :title, presence: true
  validates :city, presence: true
  validates :province, presence: true

  def valid_address?
    !self.longitude.nil?
  end

  protected
    def project_location
      [address, city, province, country].compact.join(', ')
    end
end
