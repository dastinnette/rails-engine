require "rails_helper"

RSpec.describe Api::V1::Transactions::InvoicesController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns the invoice associated with a transaction" do
      transaction = create(:transaction)
      invoice = transaction.invoice

      get :show, id: "2", transaction_id: transaction.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response["id"]).to eq(2)
      expect(json_response["status"]).to eq("pending")
      expect(json_response["customer_id"]).to eq(2)
      expect(json_response["merchant_id"]).to eq(2)
    end
  end
end
