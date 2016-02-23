class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

end
