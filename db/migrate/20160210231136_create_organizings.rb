class CreateOrganizings < ActiveRecord::Migration
  def change
    create_table :organizings do |t|
      t.integer :user_id, index: true
      t.integer :event_id, index: true

      t.timestamps null: false
    end
  end
end
