require 'rails_helper'

RSpec.describe Api::V1::InvoicesFinderController, type: :controller do

  fixtures :invoices

  describe "#index" do
    it "finds all invoices by ID" do
      get :index, format: :json, id: invoices(:invoice1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice = body.first

      expect(first_invoice["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(first_invoice["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(first_invoice["status"]).to eq invoices(:invoice1).status
      expect(first_invoice["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["customer_id"]).to_not eq invoices(:invoice2).customer_id
      expect(first_invoice["merchant_id"]).to_not eq invoices(:invoice2).merchant_id
      expect(first_invoice["status"]).to_not eq invoices(:invoice2).status
      expect(first_invoice["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all invoices by customer_id" do
      get :index, format: :json, customer_id: invoices(:invoice1).customer_id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice = body.first

      expect(first_invoice["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(first_invoice["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(first_invoice["status"]).to eq invoices(:invoice1).status
      expect(first_invoice["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["customer_id"]).to_not eq invoices(:invoice2).customer_id
      expect(first_invoice["merchant_id"]).to_not eq invoices(:invoice2).merchant_id
      expect(first_invoice["status"]).to_not eq invoices(:invoice2).status
      expect(first_invoice["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all invoices merchant_id" do
      get :index, format: :json, merchant_id: invoices(:invoice1).merchant_id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice = body.first

      expect(first_invoice["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(first_invoice["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(first_invoice["status"]).to eq invoices(:invoice1).status
      expect(first_invoice["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["customer_id"]).to_not eq invoices(:invoice2).customer_id
      expect(first_invoice["merchant_id"]).to_not eq invoices(:invoice2).merchant_id
      expect(first_invoice["status"]).to_not eq invoices(:invoice2).status
      expect(first_invoice["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all invoices by status" do
      get :index, format: :json, status: invoices(:invoice1).status

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice = body.first

      expect(first_invoice["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(first_invoice["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(first_invoice["status"]).to eq invoices(:invoice1).status
      expect(first_invoice["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["customer_id"]).to_not eq invoices(:invoice2).customer_id
      expect(first_invoice["merchant_id"]).to_not eq invoices(:invoice2).merchant_id
      expect(first_invoice["status"]).to_not eq invoices(:invoice2).status
      expect(first_invoice["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all invoices by created_at" do
      get :index, format: :json, created_at: invoices(:invoice1).created_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice = body.first

      expect(first_invoice["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(first_invoice["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(first_invoice["status"]).to eq invoices(:invoice1).status
      expect(first_invoice["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["customer_id"]).to_not eq invoices(:invoice2).customer_id
      expect(first_invoice["merchant_id"]).to_not eq invoices(:invoice2).merchant_id
      expect(first_invoice["status"]).to_not eq invoices(:invoice2).status
      expect(first_invoice["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all invoices by updated_at" do
      get :index, format: :json, updated_at: invoices(:invoice1).updated_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice = body.first

      expect(first_invoice["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(first_invoice["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(first_invoice["status"]).to eq invoices(:invoice1).status
      expect(first_invoice["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["customer_id"]).to_not eq invoices(:invoice2).customer_id
      expect(first_invoice["merchant_id"]).to_not eq invoices(:invoice2).merchant_id
      expect(first_invoice["status"]).to_not eq invoices(:invoice2).status
      expect(first_invoice["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "finds one invoice by ID" do
      get :show, format: :json, id: invoices(:invoice1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(body["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(body["status"]).to eq invoices(:invoice1).status
      expect(body["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
    end

    it "finds one invoice by customer_id" do
      get :show, format: :json, customer_id: invoices(:invoice1).customer_id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(body["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(body["status"]).to eq invoices(:invoice1).status
      expect(body["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
    end

    it "finds one invoice by merchant_id" do
      get :show, format: :json, merchant_id: invoices(:invoice1).merchant_id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(body["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(body["status"]).to eq invoices(:invoice1).status
      expect(body["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
    end

    it "finds one invoice by status" do
      get :show, format: :json, status: invoices(:invoice1).status

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(body["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(body["status"]).to eq invoices(:invoice1).status
      expect(body["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
    end

    it "finds one invoice by created_at" do
      get :show, format: :json, created_at: invoices(:invoice1).created_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(body["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(body["status"]).to eq invoices(:invoice1).status
      expect(body["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
    end

    it "finds one invoice by updated_at" do
      get :show, format: :json, updated_at: invoices(:invoice1).updated_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["customer_id"]).to eq invoices(:invoice1).customer_id
      expect(body["merchant_id"]).to eq invoices(:invoice1).merchant_id
      expect(body["status"]).to eq invoices(:invoice1).status
      expect(body["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
    end
  end
end
