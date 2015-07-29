class AddPromoFeaturedPictureToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :promo_featured_picture, :string
  end
end
