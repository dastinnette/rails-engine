require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  fixtures :items

  describe "#index" do
    it "returns all items" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      item1 = body.first
      item2 = body.last

      expect(item1["name"]).to        eq items(:item1).name
      expect(item1["description"]).to eq items(:item1).description
      expect(item1["unit_price"]).to  eq items(:item1).unit_price
      expect(item1["merchant_id"]).to eq items(:item1).merchant_id
      expect(item1["created_at"]).to  eq "2012-03-27T14:53:59.000Z"
      expect(item1["updated_at"]).to  eq "2012-03-27T14:53:59.000Z"

      expect(item2["name"]).to        eq items(:item2).name
      expect(item2["description"]).to eq items(:item2).description
      expect(item2["unit_price"]).to  eq items(:item2).unit_price
      expect(item2["merchant_id"]).to eq items(:item2).merchant_id
      expect(item2["created_at"]).to  eq "2012-03-27T14:54:09.000Z"
      expect(item2["updated_at"]).to  eq "2012-03-27T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "returns a specific item" do
      get :show, format: :json, id: items(:item1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to        eq items(:item1).name
      expect(body["description"]).to eq items(:item1).description
      expect(body["unit_price"]).to  eq items(:item1).unit_price
      expect(body["merchant_id"]).to eq items(:item1).merchant_id
      expect(body["created_at"]).to  eq "2012-03-27T14:53:59.000Z"
      expect(body["updated_at"]).to  eq "2012-03-27T14:53:59.000Z"
    end
  end
end
