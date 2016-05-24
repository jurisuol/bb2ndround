class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :category

  validates :invoice_number, uniqueness: true

  def price_with_vat
    (price + price * (vat_rate.to_f / 100)).round(2)
  end

  def self.months_summary
    summary = []
    Invoice.all.group_by{|t| [t.issued_at.year, t.issued_at.month] }.each do |group|
      price = 0
      price_with_vat = 0
      group[1].each do |i|
        price += i.price
        price_with_vat += i.price_with_vat
      end
      date = Date.new(group[0][0],group[0][1]).strftime("%Y-%m-%d")
      summary << {date: date, price: price.round(2), price_with_vat: price_with_vat.round(2)}
    end
    summary
  end

  def self.categories_summary
    summary = []
    Invoice.all.group_by{|t| [t.issued_at.year, t.issued_at.month, t.category] }.each do |group|
      price = 0
      price_with_vat = 0
      group[1].each do |i|
        price += i.price
        price_with_vat += i.price_with_vat
      end
      date = Date.new(group[0][0],group[0][1]).strftime("%Y-%m-%d")
      summary << {date: date, category: group[0][2], price: price.round(2), price_with_vat: price_with_vat.round(2)}
    end
    summary
  end

end
