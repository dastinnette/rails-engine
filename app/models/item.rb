class Item < ActiveRecord::Base
  belongs_to :merchant

  has_many :invoice_items
  #has_many :invoices, through: :invoice_items
end
