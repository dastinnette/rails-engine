require "rails_helper"

RSpec.describe Api::V1::Invoices::TransactionsController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns transactions associated with a merchants invoice" do
      merchant = create(:merchant)
      invoice = create(:invoice)
      transactions = create_list(:transaction, 2)
      merchant.invoices << invoice
      invoice.transactions << transactions

      get :index, invoice_id: invoice.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(transactions.first.id)
      expect(json_response.first["credit_card_number"]).to eq(transactions.first.credit_card_number)
      expect(json_response.last["result"]).to eq(transactions.last.result)
    end
  end
end
