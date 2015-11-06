class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :event_header_picture
      t.string :event_body_picture
      t.string :short_description
      t.text :long_description
      t.datetime :daytime
      t.text :attendance_requirements

      t.timestamps null: false
    end
  end
end
