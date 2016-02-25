class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  def favorite_merchant
    successful_invoices = invoices.joins(:transactions).where(transactions: { result: "success" })
    merchant_id = successful_invoices.group_by(&:merchant_id).max_by { |_k, v| v.count }.flatten.first
    Merchant.find(merchant_id)
  end

end
