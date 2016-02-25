require "rails_helper"

RSpec.describe Api::V1::Customers::TransactionsController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all transactions associated with a customer" do
      transaction_1 = create(:transaction)
      transaction_2 = create(:transaction)
      customer = transaction_1.invoice.customer
      invoice = transaction_2.invoice.update_attribute(:customer_id, customer.id)
      transactions = customer.transactions

      get :index, customer_id: customer.id, format: :json

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(json_response.count).to eq(2)

      expect(json_response.first["id"]).to eq(transactions.first.id)
      expect(json_response.first["credit_card_number"]).to eq(transactions.first.credit_card_number)
      expect(json_response.first["result"]).to eq(transactions.first[:result])
      expect(json_response.first["invoice_id"]).to eq(transactions.first[:invoice_id])

      expect(json_response.last["id"]).to eq(transactions.last.id)
      expect(json_response.last["credit_card_number"]).to eq(transactions.last.credit_card_number)
      expect(json_response.last["result"]).to eq(transactions.last[:result])
      expect(json_response.last["invoice_id"]).to eq(transactions.last[:invoice_id])
    end
  end
end
