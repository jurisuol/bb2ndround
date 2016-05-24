class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :category

  validates :invoice_number, uniqueness: true

  def price_with_vat
    (price + price * (vat_rate.to_f / 100)).round(2)
  end

  def self.months_summary
    summary = []
    Invoice.all.group_by{|t| [t.issued_at.year, t.issued_at.month] }.each do |(year, month), invoices|
      date = Date.new(year, month).strftime("%Y-%m-%d")
      price = 0
      price_with_vat = 0
      invoices.each do |i|
        price += i.price
        price_with_vat += i.price_with_vat
      end
      summary << {date: date, price: price, price_with_vat: price_with_vat}
    end
    summary
  end

  def self.categories_summary
    summary = []
    Invoice.all.group_by{|t| [t.issued_at.year, t.issued_at.month, t.category] }.each do |(year, month, category), invoices|
      date = Date.new(year, month).strftime("%Y-%m-%d")
      price = 0
      price_with_vat = 0
      invoices.each do |i|
        price += i.price
        price_with_vat += i.price_with_vat
      end
      summary << {date: date, category: category, price: price, price_with_vat: price_with_vat}
    end
    summary
  end

end
