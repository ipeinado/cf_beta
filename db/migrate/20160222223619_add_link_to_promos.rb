class AddLinkToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :link, :string
  end
end
