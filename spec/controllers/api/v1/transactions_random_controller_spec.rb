require 'rails_helper'

RSpec.describe Api::V1::TransactionsRandomController, type: :controller do

  fixtures :transactions

  describe "#show" do
    it "returns a random transaction" do
      get :show, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body).to_not eq nil
    end
  end

end
