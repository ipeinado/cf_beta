class Project < ActiveRecord::Base

  default_scope { where("longitude IS NOT NULL") }

  mount_uploader :logo, ProjectLogoUploader
  mount_uploader :featured_picture, FeaturedPictureUploader

  geocoded_by :project_location
  after_validation :geocode

  before_save :valid_address?

  validates :title, presence: true

  def valid_address?
    !self.longitude.nil?
  end

  protected
    def project_location
      [address, city, province, country].compact.join(', ')
    end
end
