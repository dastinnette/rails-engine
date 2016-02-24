require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do

  fixtures :transactions

  describe "#index" do
    it "returns all transactions" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      transaction1 = body.first
      transaction2 = body.last

      expect(transaction1["invoice_id"]).to         eq transactions(:transaction1).invoice_id
      expect(transaction1["credit_card_number"]).to eq transactions(:transaction1).credit_card_number
      expect(transaction1["result"]).to             eq transactions(:transaction1).result
      expect(transaction1["created_at"]).to         eq "2012-03-27T14:54:09.000Z"
      expect(transaction1["updated_at"]).to         eq "2012-03-27T14:54:09.000Z"

      expect(transaction2["invoice_id"]).to         eq transactions(:transaction2).invoice_id
      expect(transaction2["credit_card_number"]).to eq transactions(:transaction2).credit_card_number
      expect(transaction2["result"]).to             eq transactions(:transaction2).result
      expect(transaction2["created_at"]).to         eq "2012-03-26T14:54:09.000Z"
      expect(transaction2["updated_at"]).to         eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "returns a specific transaction" do
      get :show, format: :json, id: transactions(:transaction1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["invoice_id"]).to         eq transactions(:transaction1).invoice_id
      expect(body["credit_card_number"]).to eq transactions(:transaction1).credit_card_number
      expect(body["result"]).to             eq transactions(:transaction1).result
      expect(body["created_at"]).to         eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to         eq "2012-03-27T14:54:09.000Z"
    end
  end
end
