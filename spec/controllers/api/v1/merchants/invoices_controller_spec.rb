require "rails_helper"

RSpec.describe Api::V1::Merchants::InvoicesController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all invoices associated with a merchant" do
      merchant = create(:merchant)
      invoices = create_list(:invoice, 2)
      merchant.invoices << invoices

      get :index, merchant_id: merchant.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response.count).to eq(2)

      expect(json_response.first["status"]).to eq(invoices.first.status)
      expect(json_response.first["customer_id"]).to eq(invoices.first[:customer_id])
      expect(json_response.last["status"]).to eq(invoices.last.status)
      expect(json_response.last["customer_id"]).to eq(invoices.last[:customer_id])
    end
  end
end
