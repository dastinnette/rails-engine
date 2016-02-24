require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do

  fixtures :customers

  describe "#index" do
    it "returns all customers" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      customer1 = body.first
      customer2 = body.last

      expect(customer1["first_name"]).to eq customers(:customer1).first_name
      expect(customer1["last_name"]).to  eq customers(:customer1).last_name
      expect(customer1["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(customer1["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(customer2["first_name"]).to eq customers(:customer2).first_name
      expect(customer2["last_name"]).to  eq customers(:customer2).last_name
      expect(customer2["created_at"]).to eq "2012-03-28T14:54:09.000Z"
      expect(customer2["updated_at"]).to eq "2012-03-28T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "returns a specific customer" do
      get :show, format: :json, id: customers(:customer1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["first_name"]).to eq customers(:customer1).first_name
      expect(body["last_name"]).to  eq customers(:customer1).last_name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end
end
