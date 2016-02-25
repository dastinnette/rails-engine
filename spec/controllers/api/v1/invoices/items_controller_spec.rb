require "rails_helper"

RSpec.describe Api::V1::Invoices::ItemsController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns items associated with a merchants invoice" do
      invoice = create(:invoice)
      items = create_list(:item, 2)
      invoice.items << items

      get :index, id: "2", invoice_id: invoice.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.first["name"]).to eq(items.first.name)
      expect(json_response.first["description"]).to eq(items.first.description)
      expect(json_response.last["unit_price"]).to eq(374)
      expect(json_response.last["merchant_id"]).to eq(items.last.merchant_id)
    end
  end
end
