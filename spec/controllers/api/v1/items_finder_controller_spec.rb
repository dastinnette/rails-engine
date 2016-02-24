require 'rails_helper'

RSpec.describe Api::V1::ItemsFinderController, type: :controller do

  fixtures :items

  describe "#index" do
    it "finds all items by ID" do
      get :index, format: :json, id: items(:item1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first

      expect(first_item["name"]).to eq items(:item1).name
      expect(first_item["description"]).to eq items(:item1).description
      expect(first_item["unit_price"]).to eq items(:item1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["name"]).to_not eq items(:item2).name
      expect(first_item["description"]).to_not eq items(:item2).description
      expect(first_item["unit_price"]).to_not eq items(:item2).unit_price
      expect(first_item["merchant_id"]).to_not eq items(:item2).merchant_id
      expect(first_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all items by name" do
      get :index, format: :json, name: items(:item1).name

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first

      expect(first_item["name"]).to eq items(:item1).name
      expect(first_item["description"]).to eq items(:item1).description
      expect(first_item["unit_price"]).to eq items(:item1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["name"]).to_not eq items(:item2).name
      expect(first_item["description"]).to_not eq items(:item2).description
      expect(first_item["unit_price"]).to_not eq items(:item2).unit_price
      expect(first_item["merchant_id"]).to_not eq items(:item2).merchant_id
      expect(first_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all items by description" do
      get :index, format: :json, description: items(:item1).description

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first

      expect(first_item["name"]).to eq items(:item1).name
      expect(first_item["description"]).to eq items(:item1).description
      expect(first_item["unit_price"]).to eq items(:item1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["name"]).to_not eq items(:item2).name
      expect(first_item["description"]).to_not eq items(:item2).description
      expect(first_item["unit_price"]).to_not eq items(:item2).unit_price
      expect(first_item["merchant_id"]).to_not eq items(:item2).merchant_id
      expect(first_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all items by unit_price" do
      get :index, format: :json, unit_price: items(:item1).unit_price

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first

      expect(first_item["name"]).to eq items(:item1).name
      expect(first_item["description"]).to eq items(:item1).description
      expect(first_item["unit_price"]).to eq items(:item1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["name"]).to_not eq items(:item2).name
      expect(first_item["description"]).to_not eq items(:item2).description
      expect(first_item["unit_price"]).to_not eq items(:item2).unit_price
      expect(first_item["merchant_id"]).to_not eq items(:item2).merchant_id
      expect(first_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds all items by merchant_id" do
      get :index, format: :json, merchant_id: items(:item1).merchant_id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first

      expect(first_item["name"]).to eq items(:item1).name
      expect(first_item["description"]).to eq items(:item1).description
      expect(first_item["unit_price"]).to eq items(:item1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["name"]).to_not eq items(:item2).name
      expect(first_item["description"]).to_not eq items(:item2).description
      expect(first_item["unit_price"]).to_not eq items(:item2).unit_price
      expect(first_item["merchant_id"]).to_not eq items(:item2).merchant_id
      expect(first_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "finds one item by ID" do
      get :show, format: :json, id: items(:item1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq items(:item1).name
      expect(body["description"]).to eq items(:item1).description
      expect(body["unit_price"]).to eq items(:item1).unit_price
      expect(body["merchant_id"]).to eq items(:item1).merchant_id
      expect(body["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
    end

    it "finds one item by name" do
      get :show, format: :json, name: items(:item1).name

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq items(:item1).name
      expect(body["description"]).to eq items(:item1).description
      expect(body["unit_price"]).to eq items(:item1).unit_price
      expect(body["merchant_id"]).to eq items(:item1).merchant_id
      expect(body["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
    end

    it "finds one item by description" do
      get :show, format: :json, description: items(:item1).description

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq items(:item1).name
      expect(body["description"]).to eq items(:item1).description
      expect(body["unit_price"]).to eq items(:item1).unit_price
      expect(body["merchant_id"]).to eq items(:item1).merchant_id
      expect(body["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
    end

    it "finds one item by created_at" do
      get :show, format: :json, created_at: items(:item1).created_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq items(:item1).name
      expect(body["description"]).to eq items(:item1).description
      expect(body["unit_price"]).to eq items(:item1).unit_price
      expect(body["merchant_id"]).to eq items(:item1).merchant_id
      expect(body["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
    end

    it "finds one item by updated_at" do
      get :show, format: :json, updated_at: items(:item1).updated_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq items(:item1).name
      expect(body["description"]).to eq items(:item1).description
      expect(body["unit_price"]).to eq items(:item1).unit_price
      expect(body["merchant_id"]).to eq items(:item1).merchant_id
      expect(body["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
    end
  end
end
