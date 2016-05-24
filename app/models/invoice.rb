class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :category

  validates :invoice_number, uniqueness: true

  def price_with_vat
    (price + price * (vat_rate.to_f / 100)).round(2)
  end
end
