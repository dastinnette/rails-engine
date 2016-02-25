require "rails_helper"

RSpec.describe Api::V1::Customers::InvoicesController, type: :controller do

  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    fixtures :customers, :invoices

    it "returns all invoices associated with a customer" do
      customer = create(:customer)
      invoices = create_list(:invoice, 2)
      customer.invoices << invoices

      get :index, customer_id: customer.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response.count).to eq(2)

      expect(json_response.first["id"]).to eq(invoices.first.id)
      expect(json_response.first["status"]).to eq(invoices.first.status)
      expect(json_response.first["customer_id"]).to eq(invoices.first[:customer_id])
      expect(json_response.first["merchant_id"]).to eq(invoices.first[:merchant_id])

      expect(json_response.last["id"]).to eq(invoices.last.id)
      expect(json_response.last["status"]).to eq(invoices.last.status)
      expect(json_response.last["customer_id"]).to eq(invoices.last[:customer_id])
      expect(json_response.last["merchant_id"]).to eq(invoices.last[:merchant_id])
    end
  end

end
