class ManifestSupportMessage
  include ActiveModel::Model
  attr_accessor :name, :email, :bio, :twitter, :website
  validates :name, :email, presence: true
end
