class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :invoice_number
      t.decimal :price, precision: 15, scale: 2
      t.integer :vat_rate
      t.datetime :issued_at
      t.references :client, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
