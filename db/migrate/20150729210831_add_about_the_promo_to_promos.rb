class AddAboutThePromoToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :about_the_promo, :text
  end
end
