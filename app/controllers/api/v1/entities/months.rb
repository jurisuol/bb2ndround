module API
  module V1
    module Entities
      class Months < Grape::Entity
        expose :date
        expose :price_with_vat
        expose :price
      end
    end
  end
end
