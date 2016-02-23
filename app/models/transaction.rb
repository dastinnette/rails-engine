class Transaction < ActiveRecord::Base
  belongs_to :invoice

  def self.random
    order("RANDOM()").first
  end
  
end
