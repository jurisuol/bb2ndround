require 'rails_helper'

describe Invoice do
  describe '#price_with_vat' do
    it 'returns price including VAT and rounds it correctly' do
      invoice = Invoice.new(price: 33, vat_rate: 33)

      expect(invoice.price_with_vat).to eq 43.89
    end
  end
end
