require 'rails_helper'

RSpec.describe Api::V1::Invoices::MerchantsController, type: :controller do

  fixtures :invoices, :merchants

  describe "#show" do
    it "returns all invoices associated with a merchant" do
      get :show, invoice_id: invoices(:invoice1).id, format: :json 

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq merchants(:merchant1).name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end
end
