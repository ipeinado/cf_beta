class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :entity_logo
      t.string :twitter
      t.string :facebook
      t.string :website
      t.string :bio
      t.string :city

      t.timestamps null: false
    end
  end
end
