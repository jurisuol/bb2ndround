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
      end
    end
  end
end
