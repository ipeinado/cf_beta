class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :city
      t.float :longitude
      t.float :latitude
      t.string :website
      t.string :twitter

      t.timestamps null: false
    end
  end
end
