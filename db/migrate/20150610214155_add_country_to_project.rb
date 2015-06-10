class AddCountryToProject < ActiveRecord::Migration
  def change
    add_column :projects, :country, :string
  end
end
