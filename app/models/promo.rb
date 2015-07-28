class Promo < ActiveRecord::Base

  mount_uploader :promo_logo, PromoLogoUploader

  validates :name, presence: true
  validates :brief_product_description,
                presence: true,
                length: { maximum: 255 }
  validates :brief_promo_description,
                presence: true,
                length: { maximum: 255 }
end
