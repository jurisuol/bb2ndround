module API
  module V1
    module Entities
      class Invoices < Grape::Entity
        expose :id
        expose :invoice_number
        expose :price_with_vat
        expose :price
        expose :vat_rate
        expose :issued_at
        expose :client, using: Client
        expose :category, using: Category

        def price
          object.price.to_f
        end

        def price_with_vat
          object.price_with_vat.to_f
        end

      end
    end
  end
end
