# frozen_string_literal: true

class CreateEarthquakeEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :earthquake_events do |t|
      t.string :external_id
      t.float :magnitude
      t.string :place
      t.bigint :time
      t.string :url
      t.boolean :tsunami
      t.string :mag_type
      t.string :type_feature
      t.string :title
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
