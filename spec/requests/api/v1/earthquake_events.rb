# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::EarthquakeEventsController, type: :controller do
  describe 'GET #index' do
    let!(:earthquake_events) { create_list(:earthquake_event, 1) }

    before { get :index }

    it 'returns success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders JSON data' do
      expect(response.content_type).to eq('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['data']).not_to be_nil
      expect(json_response['pagination']).not_to be_nil
      expect(json_response['pagination']['current_page']).to eq(1)
      expect(json_response['pagination']['total']).to eq(EarthquakeEvent.count)
      expect(json_response['pagination']['per_page']).to eq(10)
    end
  end
end
