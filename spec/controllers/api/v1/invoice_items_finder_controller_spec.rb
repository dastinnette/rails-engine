require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsFinderController, type: :controller do

  fixtures :invoice_items

  describe "#index" do
    it "finds all invoice items by ID" do
      get :index, format: :json, id: invoice_items(:invoice_item1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice_item = body.first

      expect(first_invoice_item["item_id"]).to        eq invoice_items(:invoice_item1).item_id
      expect(first_invoice_item["invoice_id"]).to     eq invoice_items(:invoice_item1).invoice_id
      expect(first_invoice_item["quantity"]).to       eq invoice_items(:invoice_item1).quantity
      expect(first_invoice_item["unit_price"]).to     eq invoice_items(:invoice_item1).unit_price
      expect(first_invoice_item["created_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["updated_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["item_id"]).to_not    eq invoice_items(:invoice_item2).item_id
      expect(first_invoice_item["invoice_id"]).to_not eq invoice_items(:invoice_item2).invoice_id
      expect(first_invoice_item["unit_price"]).to_not eq invoice_items(:invoice_item2).unit_price
      expect(first_invoice_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all invoice items by item_id" do
      get :index, format: :json, item_id: invoice_items(:invoice_item1).item_id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice_item = body.first

      expect(first_invoice_item["item_id"]).to        eq invoice_items(:invoice_item1).item_id
      expect(first_invoice_item["invoice_id"]).to     eq invoice_items(:invoice_item1).invoice_id
      expect(first_invoice_item["quantity"]).to       eq invoice_items(:invoice_item1).quantity
      expect(first_invoice_item["unit_price"]).to     eq invoice_items(:invoice_item1).unit_price
      expect(first_invoice_item["created_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["updated_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["item_id"]).to_not    eq invoice_items(:invoice_item2).item_id
      expect(first_invoice_item["invoice_id"]).to_not eq invoice_items(:invoice_item2).invoice_id
      expect(first_invoice_item["unit_price"]).to_not eq invoice_items(:invoice_item2).unit_price
      expect(first_invoice_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all invoice items by invoice_id" do
      get :index, format: :json, invoice_id: invoice_items(:invoice_item1).invoice_id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice_item = body.first

      expect(first_invoice_item["item_id"]).to        eq invoice_items(:invoice_item1).item_id
      expect(first_invoice_item["invoice_id"]).to     eq invoice_items(:invoice_item1).invoice_id
      expect(first_invoice_item["quantity"]).to       eq invoice_items(:invoice_item1).quantity
      expect(first_invoice_item["unit_price"]).to     eq invoice_items(:invoice_item1).unit_price
      expect(first_invoice_item["created_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["updated_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["item_id"]).to_not    eq invoice_items(:invoice_item2).item_id
      expect(first_invoice_item["invoice_id"]).to_not eq invoice_items(:invoice_item2).invoice_id
      expect(first_invoice_item["unit_price"]).to_not eq invoice_items(:invoice_item2).unit_price
      expect(first_invoice_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all invoice items by quantity" do
      get :index, format: :json, quantity: invoice_items(:invoice_item1).quantity

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice_item = body.first

      expect(first_invoice_item["item_id"]).to        eq invoice_items(:invoice_item1).item_id
      expect(first_invoice_item["invoice_id"]).to     eq invoice_items(:invoice_item1).invoice_id
      expect(first_invoice_item["quantity"]).to       eq invoice_items(:invoice_item1).quantity
      expect(first_invoice_item["unit_price"]).to     eq invoice_items(:invoice_item1).unit_price
      expect(first_invoice_item["created_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["updated_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["item_id"]).to_not    eq invoice_items(:invoice_item2).item_id
      expect(first_invoice_item["invoice_id"]).to_not eq invoice_items(:invoice_item2).invoice_id
      expect(first_invoice_item["unit_price"]).to_not eq invoice_items(:invoice_item2).unit_price
      expect(first_invoice_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all invoice items by unit_price" do
      get :index, format: :json, unit_price: invoice_items(:invoice_item1).unit_price

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice_item = body.first

      expect(first_invoice_item["item_id"]).to        eq invoice_items(:invoice_item1).item_id
      expect(first_invoice_item["invoice_id"]).to     eq invoice_items(:invoice_item1).invoice_id
      expect(first_invoice_item["quantity"]).to       eq invoice_items(:invoice_item1).quantity
      expect(first_invoice_item["unit_price"]).to     eq invoice_items(:invoice_item1).unit_price
      expect(first_invoice_item["created_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["updated_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["item_id"]).to_not    eq invoice_items(:invoice_item2).item_id
      expect(first_invoice_item["invoice_id"]).to_not eq invoice_items(:invoice_item2).invoice_id
      expect(first_invoice_item["unit_price"]).to_not eq invoice_items(:invoice_item2).unit_price
      expect(first_invoice_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all invoice items by created_at" do
      get :index, format: :json, created_at: invoice_items(:invoice_item1).created_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice_item = body.first

      expect(first_invoice_item["item_id"]).to        eq invoice_items(:invoice_item1).item_id
      expect(first_invoice_item["invoice_id"]).to     eq invoice_items(:invoice_item1).invoice_id
      expect(first_invoice_item["quantity"]).to       eq invoice_items(:invoice_item1).quantity
      expect(first_invoice_item["unit_price"]).to     eq invoice_items(:invoice_item1).unit_price
      expect(first_invoice_item["created_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["updated_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["item_id"]).to_not    eq invoice_items(:invoice_item2).item_id
      expect(first_invoice_item["invoice_id"]).to_not eq invoice_items(:invoice_item2).invoice_id
      expect(first_invoice_item["unit_price"]).to_not eq invoice_items(:invoice_item2).unit_price
      expect(first_invoice_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all invoice items by updated_at" do
      get :index, format: :json, updated_at: invoice_items(:invoice_item1).updated_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice_item = body.first

      expect(first_invoice_item["item_id"]).to        eq invoice_items(:invoice_item1).item_id
      expect(first_invoice_item["invoice_id"]).to     eq invoice_items(:invoice_item1).invoice_id
      expect(first_invoice_item["quantity"]).to       eq invoice_items(:invoice_item1).quantity
      expect(first_invoice_item["unit_price"]).to     eq invoice_items(:invoice_item1).unit_price
      expect(first_invoice_item["created_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["updated_at"]).to     eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["item_id"]).to_not    eq invoice_items(:invoice_item2).item_id
      expect(first_invoice_item["invoice_id"]).to_not eq invoice_items(:invoice_item2).invoice_id
      expect(first_invoice_item["unit_price"]).to_not eq invoice_items(:invoice_item2).unit_price
      expect(first_invoice_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_invoice_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "finds one invoice item by ID" do
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

    it "finds one invoice item by item_id" do
      get :show, format: :json, item_id: invoice_items(:invoice_item1).item_id

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

    it "finds one invoice item by invoice_id" do
      get :show, format: :json, invoice_id: invoice_items(:invoice_item1).invoice_id

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

    it "finds one invoice item by quantity" do
      get :show, format: :json, quantity: invoice_items(:invoice_item1).quantity

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

    it "finds one invoice item by unit_price" do
      get :show, format: :json, unit_price: invoice_items(:invoice_item1).unit_price

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

    it "finds one invoice item by created_at" do
      get :show, format: :json, created_at: invoice_items(:invoice_item1).created_at

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

    it "finds one invoice item by updated_at" do
      get :show, format: :json, updated_at: invoice_items(:invoice_item1).updated_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["item_id"]).to eq invoice_items(:invoice_item1).item_id
      expect(body["invoice_id"]).to eq invoice_items(:invoice_item1).invoice_id
      expect(body["quantity"]).to eq invoice_items(:invoice_item1).quantity
      expect(body["unit_price"]).to eq invoice_items(:invoice_item1).unit_price
      expect(body["created_at"]).to eq "2012-03-27T14:54:11.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:11.000Z"
    end
  end
end
