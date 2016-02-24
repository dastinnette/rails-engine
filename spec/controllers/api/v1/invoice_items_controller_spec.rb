require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do

  fixtures :invoice_items

  describe "#index" do
    it "returns all invoice items" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      invoice_item1 = body.first
      invoice_item2 = body.last

      expect(invoice_item1["item_id"]).to    eq invoice_items(:invoice_item1).item_id
      expect(invoice_item1["invoice_id"]).to eq invoice_items(:invoice_item1).invoice_id
      expect(invoice_item1["quantity"]).to   eq invoice_items(:invoice_item1).quantity
      expect(invoice_item1["unit_price"]).to eq invoice_items(:invoice_item1).unit_price
      expect(invoice_item1["created_at"]).to eq "2012-03-27T14:54:11.000Z"
      expect(invoice_item1["updated_at"]).to eq "2012-03-27T14:54:11.000Z"

      expect(invoice_item2["item_id"]).to    eq invoice_items(:invoice_item2).item_id
      expect(invoice_item2["invoice_id"]).to eq invoice_items(:invoice_item2).invoice_id
      expect(invoice_item2["quantity"]).to   eq invoice_items(:invoice_item2).quantity
      expect(invoice_item2["unit_price"]).to eq invoice_items(:invoice_item2).unit_price
      expect(invoice_item2["created_at"]).to eq "2012-03-27T14:58:15.000Z"
      expect(invoice_item2["updated_at"]).to eq "2012-03-27T14:58:15.000Z"
    end
  end

  describe "#show" do
    it "returns a specific invoice_item" do
      get :show, format: :json, id: invoice_items(:invoice_item1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["item_id"]).to    eq invoice_items(:invoice_item1).item_id
      expect(body["invoice_id"]).to eq invoice_items(:invoice_item1).invoice_id
      expect(body["quantity"]).to   eq invoice_items(:invoice_item1).quantity
      expect(body["unit_price"]).to eq invoice_items(:invoice_item1).unit_price
      expect(body["created_at"]).to eq "2012-03-27T14:54:11.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:11.000Z"
    end
  end
end
