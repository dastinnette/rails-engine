class Item < ActiveRecord::Base
  before_validation :calculate_money
  validates :unit_price, presence: true

  belongs_to :merchant
  has_many :invoice_items
  #has_many :invoices, through: :invoice_items

  def self.random
    order("RANDOM()").first
  end

  private

  def calculate_money
    self.unit_price = (self.unit_price.to_f/100).to_s
  end

end
