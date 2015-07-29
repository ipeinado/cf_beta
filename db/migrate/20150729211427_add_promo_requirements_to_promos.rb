class AddPromoRequirementsToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :promo_requirements, :text
  end
end
