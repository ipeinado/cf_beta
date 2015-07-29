class Promo < ActiveRecord::Base

  mount_uploader :promo_logo, PromoLogoUploader
  mount_uploader :promo_featured_picture, PromoFeaturedPictureUploader

  validates :name, presence: true
  validates :brief_product_description,
                presence: true,
                length: { maximum: 255 }
  validates :brief_promo_description,
                presence: true,
                length: { maximum: 255 }
end
