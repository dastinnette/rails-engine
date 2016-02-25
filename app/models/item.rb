class Item < ActiveRecord::Base
  before_validation :calculate_money
  validates :unit_price, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.random
    order("RANDOM()").first
  end

  def best_day
    successful_transactions = invoices.joins(:transactions).where(transactions: { result: "success" })
    successful_transactions.group('"invoices"."created_at"').order("sum_quantity DESC").sum("quantity").first[0]
  end

  private

  def calculate_money
    self.unit_price = (self.unit_price.to_f/100).to_s
  end

end
