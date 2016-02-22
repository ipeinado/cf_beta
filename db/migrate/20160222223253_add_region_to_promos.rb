class AddRegionToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :region, :string
  end
end
