class Transaction < ActiveRecord::Base
  belongs_to :invoice
end
