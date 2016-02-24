require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do

  fixtures :merchants

  describe "#index" do
    it "returns all merchants" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      merchant1 = body.first
      merchant2 = body.last

      expect(merchant1["name"]).to       eq merchants(:merchant1).name
      expect(merchant1["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(merchant1["updated_at"]).to eq "2012-03-27T14:54:09.000Z"

      expect(merchant2["name"]).to       eq merchants(:merchant2).name
      expect(merchant2["created_at"]).to eq "2012-03-26T14:54:09.000Z"
      expect(merchant2["updated_at"]).to eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "returns a specific merchant" do
      get :show, format: :json, id: merchants(:merchant1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq merchants(:merchant1).name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end
end
