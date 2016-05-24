module API
  module V1
    module Entities
      class Months < Grape::Entity
        expose :date
        expose :price_with_vat
        expose :price

        def price_with_vat
          object[:price_with_vat].to_f
        end

        def price
          object[:price].to_f
        end
      end
    end
  end
end
