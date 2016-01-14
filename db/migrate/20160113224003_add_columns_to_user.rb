class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :bio, :string
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
    add_column :users, :website, :string
    add_column :users, :avatar, :string
  end
end
