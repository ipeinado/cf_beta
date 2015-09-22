class Promo < ActiveRecord::Base

  has_many :categorizings
  has_many :categories, through: :categorizings

  mount_uploader :promo_logo, PromoLogoUploader
  mount_uploader :promo_featured_picture, PromoFeaturedPictureUploader

  validates :name, presence: true
  validates :brief_product_description,
                presence: true,
                length: { maximum: 255 }
  validates :brief_promo_description,
                presence: true,
                length: { maximum: 255 }

  def all_categories=(names)
    self.categories = names.split(", ").map do |name|
      Category.where(name: name.strip).first_or_create!
    end
  end

  def all_categories
    self.categories.map(&:name).join(", ")
  end
end
