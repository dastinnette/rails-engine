require "csv"

task :import => :environment do

  CSV.readlines('data/customers.csv', headers: true, header_converters: :symbol).each do |row|
    Customer.create!(row.to_h)
  end
  puts "created customers"

  CSV.readlines('data/merchants.csv', headers: true, header_converters: :symbol).each do |row|
    Merchant.create!(row.to_h)
  end
  puts "created merchants"

  CSV.readlines('data/items.csv', headers: true, header_converters: :symbol).each do |row|
    Item.create!(row.to_h)
  end
  puts "created items"

  CSV.readlines('data/invoices.csv', headers: true, header_converters: :symbol).each do |row|
    Invoice.create!(row.to_h)
  end
  puts "created invoices"

  CSV.readlines('data/invoice_items.csv', headers: true, header_converters: :symbol).each do |row|
    InvoiceItem.create!(row.to_h)
  end
  puts "created invoice items"

  CSV.readlines('data/transactions.csv', headers: true, header_converters: :symbol).each do |row|
    Transaction.create!({id:                row[:id],
                        invoice_id:         row[:invoice_id],
                        credit_card_number: row[:credit_card_number],
                        result:             row[:result],
                        created_at:         row[:created_at],
                        updated_at:         row[:updated_at]})
  end
  puts "created transactions"
end
