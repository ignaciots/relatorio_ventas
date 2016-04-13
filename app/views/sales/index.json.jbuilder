json.array!(@sales) do |sale|
  json.extract! sale, :id, :sales_date, :number_of_bills, :bill_sale_amount, :number_of_invoices, :invoice_sale_amount, :store_id
  json.url sale_url(sale, format: :json)
end
