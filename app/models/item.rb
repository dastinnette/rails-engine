class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  #has_many :invoices, through: :invoice_items

  def self.random
    order("RANDOM()").first
  end

end
