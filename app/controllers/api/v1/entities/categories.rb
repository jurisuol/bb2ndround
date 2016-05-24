module API
  module V1
    module Entities
      class Categories < Grape::Entity
        expose :date
        expose :category, using: Entities::Category
        expose :price_with_vat
        expose :price
      end
    end
  end
end
