class AddManifestSupportToEntities < ActiveRecord::Migration
  def change
    add_column :entities, :manifest_support, :boolean
  end
end
