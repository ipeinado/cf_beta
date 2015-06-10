class AddProvinceToProject < ActiveRecord::Migration
  def change
    add_column :projects, :province, :string
  end
end
