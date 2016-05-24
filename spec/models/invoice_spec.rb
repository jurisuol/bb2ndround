require 'rails_helper'

describe Invoice do
  describe '#price_with_vat' do
    it 'returns price including VAT and rounds it correctly' do
      invoice = Invoice.new(price: 33, vat_rate: 33)

      expect(invoice.price_with_vat).to eq 43.89
    end
  end

  context 'summary methods' do
    before do
      @cat1 = Category.create(name: 'cat1')
      @cat2 = Category.create(name: 'cat2')
      Invoice.create(invoice_number: '1', price: 500, vat_rate: 10, category: @cat1, issued_at: Date.parse('2016-04-01'))
      Invoice.create(invoice_number: '2', price: 300, vat_rate: 15, category: @cat2, issued_at: Date.parse('2016-04-01'))
      Invoice.create(invoice_number: '3', price: 500, vat_rate: 10, category: @cat1, issued_at: Date.parse('2016-05-01'))
    end

    describe '.months_summary' do
      it 'return months summary' do
        response = [{ date: '2016-04-01', price: 800.0, price_with_vat: 895.0 },
                    { date: '2016-05-01', price: 500.0, price_with_vat: 550.0 }]

        expect(Invoice.months_summary).to eq response
      end
    end

    describe '.categories_summary' do
      it 'it returns categories summary' do
        response = [{ date: '2016-04-01', category: @cat1, price: 500.0, price_with_vat: 550.0 },
                    { date: '2016-04-01', category: @cat2, price: 300.0, price_with_vat: 345.0 },
                    { date: '2016-05-01', category: @cat1, price: 500.0, price_with_vat: 550.0 }]
        expect(Invoice.categories_summary).to eq response
      end
    end
  end
end
