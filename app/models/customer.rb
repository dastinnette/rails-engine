class Customer < ActiveRecord::Base
  has_many :invoices
  # has_many :transactions, through: :invoices
end
