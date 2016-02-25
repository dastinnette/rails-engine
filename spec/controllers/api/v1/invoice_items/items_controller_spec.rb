require "rails_helper"

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns item associated with a particular invoice item" do
      invoice_item = create(:invoice_item)
      item = invoice_item.item

      get :show, id: "2", invoice_item_id: invoice_item.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response["id"]).to eq(2)
      expect(json_response["name"]).to eq("Whisker dos")
      expect(json_response["merchant_id"]).to eq(2)
      expect(json_response["description"]).to eq("With or without the scooter stick")
      expect(json_response["unit_price"]).to eq(25678)
    end
  end
end
