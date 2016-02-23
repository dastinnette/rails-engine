require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do

  describe "GET /api/vi/customers" do

    it "tests the #index" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end

    it "tests the #index returns the right customer attributes" do
      Customer.create(first_name: "Joey", last_name: "Donut")
      get :index, format: :json
      expect(response_data.first["id"]).to eq (customer.id)
      expect(response_data.first["first_name"]).to eq("Joey")
      expect(response_data.first["last_name"]).to eq("Donut")
    end

  end
end
