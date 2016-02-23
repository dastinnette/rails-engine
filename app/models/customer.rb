class Customer < ActiveRecord::Base
  has_many :invoices
  # has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

end
