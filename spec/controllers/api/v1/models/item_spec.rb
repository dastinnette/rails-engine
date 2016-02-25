require 'rails_helper'

RSpec.describe Item, type: :model do

  fixtures :merchants,
           :invoices,
           :transactions,
           :items,
           :invoice_items,
           :customers

  describe "item model testing" do
    it "finds best day" do
      item = Item.first.best_day
      
      expect(item).to eq "2012-03-25 09:54:09 UTC"
    end

  end
end
