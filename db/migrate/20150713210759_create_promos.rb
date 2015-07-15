class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :promo_logo
      t.string :name
      t.string :brief_product_description
      t.string :brief_promo_description
      t.text :long_product_description
      t.string :twitter
      t.string :facebook
      t.string :website

      t.timestamps null: false
    end
    add_index :promos, :name, unique: true
  end
end
