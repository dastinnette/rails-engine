require "rails_helper"

RSpec.describe Api::V1::Merchants::ItemsController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns the items associated with a merchant" do
      items = create_list(:item, 2)
      merchant = create(:merchant)
      merchant.items << items

      get :index, merchant_id: merchant.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response.count).to eq(2)

      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.first["name"]).to eq(items.first.name)
      expect(json_response.first["description"]).to eq(items.first.description)
      expect(json_response.first["unit_price"]).to eq(3)
      expect(json_response.first["merchant_id"]).to eq(items.first.merchant_id)

      expect(json_response.last["id"]).to eq(items.last.id)
      expect(json_response.last["name"]).to eq(items.last.name)
      expect(json_response.last["description"]).to eq(items.last.description)
      expect(json_response.last["unit_price"]).to eq(3)
      expect(json_response.last["merchant_id"]).to eq(items.last.merchant_id)
    end
  end
end
