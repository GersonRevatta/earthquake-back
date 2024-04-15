# frozen_string_literal: true

module Api
  module V1
    class EarthquakeEventsController < ApplicationController
      def index
        render json: response_data
      end

      def response_data
        {
          data: JSON.parse(EarthquakeEventBlueprint.render(EarthquakeEvent.all)),
          pagination: {
            current_page: 1,
            total: EarthquakeEvent.count,
            per_page: 10
          }
        }
      end
    end
  end
end
