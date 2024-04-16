# frozen_string_literal: true

module Services
  module Earthquake
    class Response
      def call(elements)
        @elements = elements[:elements]
        get_data
      end

      private

      def get_data
        @elements.map do |event|
          {
            id: event.id,
            links: event.url,
            type: event.type_feature,
            attributes: {
              external_id: event.external_id,
              magnitude: event.magnitude,
              place: event.place,
              time: event.time,
              tsunami: event.tsunami,
              mag_type: event.mag_type,
              title: event.title,
              coordinates: {
                longitude: event.longitude,
                latitude: event.latitude
              }
            }
          }
        end
      end
    end
  end
end
