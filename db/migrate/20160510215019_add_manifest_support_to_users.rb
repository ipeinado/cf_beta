class AddManifestSupportToUsers < ActiveRecord::Migration
  def change
    add_column :users, :manifest_support, :boolean
  end
end
