class Transaction < ActiveRecord::Base
  belongs_to :invoice
  has_many :customers, through: :invoice

  def self.random
    order("RANDOM()").first
  end

end
