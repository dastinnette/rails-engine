require 'rails_helper'

RSpec.describe Transaction, type: :model do

  it "is invalid without a result" do
    transaction = Transaction.new(invoice_id: 1, credit_card_number: "4654405418249632")
    expect(transaction).to be_invalid
  end

  it "is invalid without a credit_card_number" do
    transaction = Transaction.new(invoice_id: 1, result: "success")
    expect(transaction).to be_invalid
  end

end
