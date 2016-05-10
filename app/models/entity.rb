class Entity < ActiveRecord::Base

  scope :manifest_supporters, -> { where( manifest_support: true )}

  has_many :sponsorships, as: :sponsor, dependent: :destroy
  has_many :events, through: :sponsorships

  validates :name, presence: true
  validates :bio, length: { maximum: 255 }

  mount_uploader :entity_logo, EntityLogoUploader

end
