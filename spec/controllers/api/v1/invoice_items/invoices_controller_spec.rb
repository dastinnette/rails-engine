require "rails_helper"

RSpec.describe Api::V1::InvoiceItems::InvoicesController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns invoice associated with a particular invoice item" do
      invoice_item = create(:invoice_item)
      invoice = invoice_item.invoice

      get :show, id: "2", invoice_item_id: invoice_item.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response["id"]).to eq(2)
      expect(json_response["customer_id"]).to eq(2)
      expect(json_response["merchant_id"]).to eq(2)
      expect(json_response["status"]).to eq("pending")
    end
  end
end
