class AddIndexToSponsorships < ActiveRecord::Migration
  def change
    change_column_null(:sponsorships, :sponsor_id, false)
    change_column_null(:sponsorships, :event_id, false)
    add_index(:sponsorships, [:sponsor_id, :event_id, :sponsor_type])
  end
end
