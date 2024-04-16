# frozen_string_literal: true

module Api
  module V1
    class EarthquakeEventsController < ApplicationController
      def index
        render json: response_data
      end

      def response_data
        # TODO: blueprint comenzo a fallar por un update de las gemas, se reemplazo con un servicio
        # JSON.parse(EarthquakeEventBlueprint.render(EarthquakeEvent.all))
        {
          data: custom_json(earthquake_events),
          pagination: {
            current_page: 1,
            total: EarthquakeEvent.count,
            per_page: 10
          }
        }
      end

      private

      def earthquake_events
        @earthquake_events ||= EarthquakeEvent.all
      end

      def custom_json(earthquake_events)
        Services::Earthquake::Response.new.call(elements: earthquake_events)
      end
    end
  end
end
