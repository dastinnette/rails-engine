require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do

  fixtures :invoices

  describe "#index" do
    it "returns all invoices" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      invoice1 = body.first
      invoice2 = body.last

      expect(invoice1["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(invoice1["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(invoice1["status"]).to      eq invoices(:invoice1).status
      expect(invoice1["created_at"]).to  eq "2012-03-25T09:54:09.000Z"
      expect(invoice1["updated_at"]).to  eq "2012-03-25T09:54:09.000Z"
      expect(invoice2["customer_id"]).to eq invoices(:invoice2).customer_id
      expect(invoice2["merchant_id"]).to eq invoices(:invoice2).merchant_id
      expect(invoice2["status"]).to      eq invoices(:invoice2).status
      expect(invoice2["created_at"]).to  eq "2012-03-23T02:58:15.000Z"
      expect(invoice2["updated_at"]).to  eq "2012-03-23T02:58:15.000Z"
    end
  end

  describe "#show" do
    it "returns a specific invoice" do
      get :show, format: :json, id: invoices(:invoice1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(body["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(body["status"]).to      eq invoices(:invoice1).status
      expect(body["created_at"]).to  eq "2012-03-25T09:54:09.000Z"
      expect(body["updated_at"]).to  eq "2012-03-25T09:54:09.000Z"
    end
  end
end
