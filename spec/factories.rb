require 'faker'

FactoryGirl.define do

  factory :customer do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    created_at "2016-02-23T00:00:00.000Z"
    updated_at "2016-02-23T00:00:00.000Z"
  end

  factory :item do
    name Faker::Commerce.product_name
    description Faker::Lorem.sentence(8)
    unit_price 37462
    merchant
    created_at "2016-02-23T00:00:00.000Z"
    updated_at "2016-02-23T00:00:00.000Z"
  end

  factory :invoice do
    customer
    merchant
    status "shipped"
    created_at "2016-02-23T00:00:00.000Z"
    updated_at "2016-02-23T00:00:00.000Z"
  end

  factory :invoice_item do
    item
    invoice
    quantity Faker::Number.digit
    unit_price 62809
    created_at "2016-02-23T00:00:00.000Z"
    updated_at "2016-02-23T00:00:00.000Z"
  end

  factory :merchant do
    name Faker::Company.name
    created_at "2016-02-23T00:00:00.000Z"
    updated_at "2016-02-23T00:00:00.000Z"
  end

  factory :transaction do
    invoice
    credit_card_number Faker::Business.credit_card_number.gsub!("-", "")
    result
    created_at "2016-02-23T00:00:00.000Z"
    updated_at "2016-02-23T00:00:00.000Z"
  end

  sequence :result, ["success", "failed"].cycle do |result|
    result
  end

end
