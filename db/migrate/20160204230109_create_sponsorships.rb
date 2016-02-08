class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.integer :sponsor_id, index: true
      t.integer :event_id, index: true
      t.string :sponsor_type
      t.timestamps null: false
    end
  end
end
