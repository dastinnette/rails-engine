require "rails_helper"

RSpec.describe Api::V1::Invoices::MerchantsController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns merchant associated with an invoice" do
      merchant = create(:merchant)
      invoices = create_list(:invoice, 2)
      invoice = invoices.first
      invoice.merchant_id = merchant.id
      merchant.invoices << invoices

      get :show, id: "2", invoice_id: invoice.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response["id"]).to eq(2)
      expect(json_response["name"]).to eq("McDonalds")
    end
  end
end
