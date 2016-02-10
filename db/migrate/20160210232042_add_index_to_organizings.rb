class AddIndexToOrganizings < ActiveRecord::Migration
  def change
    add_index :organizings, [:user_id, :event_id], unique: true
  end
end
