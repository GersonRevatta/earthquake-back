# frozen_string_literal: true

class EarthquakeEvent < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :url, :place, :mag_type, :latitude, :longitude, presence: true
  validates :magnitude, numericality: { greater_than_or_equal_to: -1.0, less_than_or_equal_to: 10.0 }
  validates :latitude, numericality: { greater_than_or_equal_to: -90.0, less_than_or_equal_to: 90.0 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180.0, less_than_or_equal_to: 180.0 }
  validates :title, uniqueness: { scope: %i[magnitude latitude longitude] }
end
