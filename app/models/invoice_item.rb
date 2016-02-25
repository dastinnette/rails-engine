class InvoiceItem < ActiveRecord::Base
  before_validation :calculate_money
  validates :unit_price, presence: true
  validates :quantity, presence: true

  belongs_to :item
  belongs_to :invoice

  def self.random
    order("RANDOM()").first
  end

  private

  def calculate_money
    self.unit_price = (self.unit_price.to_f/100).to_s
  end

end
