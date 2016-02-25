require "rails_helper"

RSpec.describe Api::V1::Invoices::CustomersController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns customer associated with a merchants invoice" do
      merchant = create(:merchant)
      invoices = create_list(:invoice, 2)
      invoice = invoices.first
      customer = create(:customer)
      invoice.customer_id = customer.id
      merchant.invoices << invoices

      get :show, id: "2", invoice_id: invoice.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response["id"]).to eq(2)
      expect(json_response["first_name"]).to eq("Donald")
      expect(json_response["last_name"]).to eq("Trump")
    end
  end
end
