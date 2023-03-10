require 'rails_helper'

RSpec.describe "Routes", type: :request do
  let!(:route) { create(:route) }

  describe "GET /api/v1/routes/:id" do
    context 'when requesting an existing route' do
      before do
        get "/api/v1/routes/#{route.id}"
      end
      it 'returns status code 200' do
        expect(response).to have_http_status :ok
      end
      it 'must return a JSON' do
        expect(response.content_type).to include("application/json")
      end
    end
    context 'when requesting a non-existing route' do
      before do
        get "/api/v1/routes/9999"
      end
      it 'returns status code 404' do
        expect(response).to have_http_status :not_found
      end
    end
  end
end
