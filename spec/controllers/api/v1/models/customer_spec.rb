require 'rails_helper'

RSpec.describe Customer, type: :model do

  fixtures :merchants,
           :invoices,
           :transactions,
           :items,
           :invoice_items,
           :customers

  describe "customer model testing" do
    it "finds favorite merchant" do
      customer = Customer.first.favorite_merchant

      expect(customer[:name]).to eq "MacDonald's"
    end

    it "is invalid without a first name" do
      customer = Customer.new(last_name: "Ondricka")
      expect(customer).to be_invalid
    end

    it "is invalid without a last name" do
      customer = Customer.new(first_name: "Joey")
      expect(customer).to be_invalid
    end

  end
end
