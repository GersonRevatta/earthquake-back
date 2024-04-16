# frozen_string_literal: true

# spec/controllers/api/v1/comments_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  describe 'GET #index' do
    let(:earthquake_event) { create(:earthquake_event) }

    before do
      get :index, params: { earthquake_event_id: earthquake_event.id }
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end
  end
end
