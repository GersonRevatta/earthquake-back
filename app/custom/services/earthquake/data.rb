# frozen_string_literal: true

module Services
  # Services::Earthquake::Data.new.call
  # EarthquakeEvent.count
  module Earthquake
    class Data
      require 'httparty'

      def initialize
        @base_uri = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'
      end

      def call
        get_data
      end

      private

      def get_data
        response = HTTParty.get(@base_uri)
        unless response.success?
          raise "Error al obtener los datos de los terremotos: #{response.code} - #{response.message}"
        end

        data = JSON.parse(response.body)
        events_past_30_days = data['features'].select do |event|
          event['properties']['time'] > (Time.now - 30.days).to_i * 1000
        end
        save_data events_past_30_days
      end

      def save_data(data)
        data.each do |feature_data|
          feature = EarthquakeEvent.new(
            type_feature: feature_data['type'],
            external_id: feature_data['id'],
            title: feature_data['properties']['title'],
            url: feature_data['properties']['url'],
            place: feature_data['properties']['place'],
            mag_type: feature_data['properties']['magType'],
            magnitude: feature_data['properties']['mag'],
            latitude: feature_data['geometry']['coordinates'][1],
            longitude: feature_data['geometry']['coordinates'][0],
            time: feature_data['properties']['time'],
            tsunami: feature_data['properties']['tsunami']
          )
          feature.save if feature.valid?
        end
      end
    end
  end
end
