class AddAccessibilityOptionsToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :accessibility_options, :text
  end
end
