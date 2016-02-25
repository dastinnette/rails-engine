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

  def favorite_customer
    successful_invoices = invoices.joins(:transactions).where(transactions: { result: "success" })
    customer_id = successful_invoices.group_by(&:customer_id).max_by { |_k, v| v.count }.flatten.first
    Customer.find(customer_id)
  end

  def customers_with_pending_invoices
    pending_invoices = invoices.joins(:transactions).where(transactions: { result: "failed" })
    pending_invoices.map(&:customer).uniq
  end

end
