class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :invoice, index: true, foreign_key: true
      t.string :credit_card_number
      t.string :credit_card_expiration_date
      t.string :result

      t.timestamps null: false
    end
  end
end
