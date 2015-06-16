class AddFeaturedPictureToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :featured_picture, :string
  end
end
