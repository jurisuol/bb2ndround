module API
  module V1
    class Base < Grape::API
      mount API::V1::Invoices
      mount API::V1::Summary
    end
  end
end
