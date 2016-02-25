require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do

  it "is invalid without a item_id" do
    invoice_item = InvoiceItem.new(invoice_id: 1, quantity: 5, unit_price: 100.10)
    expect(invoice_item).to be_invalid
  end

  it "is invalid without a invoice_id" do
    invoice_item = InvoiceItem.new(item_id: 539, quantity: 5, unit_price: 100.10)
    expect(invoice_item).to be_invalid
  end

end
