require 'rails_helper'

RSpec.describe Merchant, type: :model do

  fixtures :merchants,
           :invoices,
           :transactions,
           :items,
           :invoice_items,
           :customers

  describe "merchant model testing" do
    it "finds revenue" do
      merchant = Merchant.first.revenue

      expect(merchant).to eq 7495
    end

    it "finds revenue by date" do
      merchant = Merchant.first.revenue_by_date("2012-03-25 09:54:09 UTC")

      expect(merchant).to eq 7495
    end

    it "finds favorite customer" do
      customer = Merchant.first.favorite_customer

      expect(customer[:first_name]).to eq "Ted"
      expect(customer[:last_name]).to eq "Cruz"
    end

  end
end
