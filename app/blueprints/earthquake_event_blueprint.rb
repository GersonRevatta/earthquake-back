# frozen_string_literal: true

class EarthquakeEventBlueprint < Blueprinter::Base
  identifier :id

  field :links, &:url

  field :type, &:type_feature

  field :attributes do |earthquake_event|
    {
      external_id: earthquake_event.external_id,
      magnitude: earthquake_event.magnitude,
      place: earthquake_event.place,
      time: earthquake_event.time,
      tsunami: earthquake_event.tsunami,
      mag_type: earthquake_event.mag_type,
      title: earthquake_event.title,
      coordinates: CoordinatesBlueprint.render_as_hash({
                                                         longitude: earthquake_event.longitude,
                                                         latitude: earthquake_event.latitude
                                                       })
    }
  end

  # field :coordinates do |earthquake_event|
  #   {
  #     longitude: earthquake_event.longitude,
  #     latitude: earthquake_event.latitude,
  #   }
  # end
  # external_id: feature_data['properties']['id'],
  # title: feature_data['properties']['title'],
  # url: feature_data['properties']['url'],
  # place: feature_data['properties']['place'],
  # mag_type: feature_data['properties']['magType'],
  # magnitude: feature_data['properties']['mag'],
  # latitude: feature_data['geometry']['coordinates'][1],
  # longitude: feature_data['geometry']['coordinates'][0],
  # time:  feature_data['properties']['time'],
  # tsunami: feature_data['properties']['tsunami'],

  #       "attributes": {
  #         "external_id": String,
  #         "magnitude": Decimal,
  #         "place": String,
  #         "time": String,
  #         "tsunami": Boolean,
  #         "mag_type": String,
  #         "title": String,
  #         "coordinates": {
  #         "longitude": Decimal,
  #         "latitude": Decimal
  #         }
  #       },
end
