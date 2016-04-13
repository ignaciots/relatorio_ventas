class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :sales_date
      t.integer :number_of_bills
      t.integer :bill_sale_amount
      t.integer :number_of_invoices
      t.integer :invoice_sale_amount
      t.belongs_to :store, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
