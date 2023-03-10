require 'rails_helper'

RSpec.describe "Deliveries", type: :request do
  let!(:trip) { create(:trip) }

  describe "POST /api/v1/trips/:trip_id" do
    context 'when creating a delivery ' do
      before do
        post "/api/v1/trips/#{trip.id}/deliveries", params: { "delivery": { "recipient": "False name", "address": "False address" } }
      end
      it 'returns status code 204' do
        expect(response).to have_http_status :created
      end
      it 'must return a Hash' do
        expect(response.content_type).to include("application/json")
      end
    end
    context 'when creating a delivery with missing params' do
      before do
        post "/api/v1/trips/#{trip.id}/deliveries", params: { "delivery": { "name": "False name"} }
      end
      it 'returns status code 422' do
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end
end
