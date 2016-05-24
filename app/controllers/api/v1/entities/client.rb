module API
  module V1
    module Entities
      class Client < Grape::Entity
        expose :id
        expose :name
      end
    end
  end
end
