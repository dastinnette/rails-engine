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

  end
end
