class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  # has_many :invoice_items, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  def revenue
    invoices.joins(:transactions).where(transactions: { result: "success" }).joins(:invoice_items).sum("quantity * unit_price")
  end

  def revenue_by_date(date)
    invoices.where(created_at: date).joins(:transactions).where(transactions: { result: "success" }).joins(:invoice_items).sum("quantity * unit_price")
  end

end
