class Customer < ActiveRecord::Base
  has_many :invoices
  
end
