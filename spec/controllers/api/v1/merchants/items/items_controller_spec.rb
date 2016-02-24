require 'rails_helper'

RSpec.describe Api::V1::Merchants::ItemsController, type: :controller do

  fixtures :items

  describe "#index" do
    it "returns all items associated with a merchant" do
      item_3 = Item.create(name: "Item Ea Voluptatum",
                           description: "Sunt officia eum qui molestiae. Nesciunt quidem cu...",
                           unit_price: 32301,
                           merchant_id: 558182687,
                           created_at: "2012-03-27 14:53:59",
                           updated_at: "2012-03-27 14:53:59"
                           )
      get :index, format: :json, merchant_id: 558182687

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      first_item = body.first
      last_item = body.last

      expect(first_item["name"]).to eq items(:item_1).name
      expect(first_item["description"]).to eq items(:item_1).description
      expect(first_item["unit_price"]).to eq items(:item_1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item_1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(last_item["name"]).to eq item_3.name
      expect(last_item["description"]).to eq item_3.description
      expect(last_item["unit_price"]).to eq item_3.unit_price
      expect(last_item["merchant_id"]).to eq item_3.merchant_id
      expect(last_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(last_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
    end
  end
end
