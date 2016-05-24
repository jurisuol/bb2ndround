require 'csv'

namespace :invoices do
  desc 'Imports invoices from tmp/invoices.csv file'
  task import: :environment do

    csv_body = File.open("tmp/invoices.csv", "rb").read

    csv = CSV.new(csv_body, :headers => true, :header_converters => :symbol, :converters => :all)
    count = 0
    csv.to_a.map do |row|
      hash = row.to_hash
      category = Category.find_or_create_by!(name: hash[:category_name])
      client = Client.find_or_create_by!(name: hash[:client_name], company_number: hash[:client_company_number])
      count +=1 if Invoice.create!(invoice_number: hash[:invoice_number],
                                   price: hash[:invoice_price],
                                   vat_rate: hash[:invoice_vat_rate],
                                   issued_at: DateTime.parse(hash[:invoice_issued_at]),
                                   client_id: client.id,
                                   category_id: category.id)
    end
    puts "#{count} invoices were imported."
  end
end
