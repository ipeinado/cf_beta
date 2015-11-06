class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :venue_picture
      t.string :website
      t.string :twitter
      t.string :facebook
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.text :accessibility
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
