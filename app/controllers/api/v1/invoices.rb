module API
  module V1
    class Invoices < Grape::API
      version 'v1'
      format :json
        resource :invoices do
          desc 'Return list of invoices'
          get do
            result = Invoice.all
            present result, with: Entities::Invoices, root: 'invoices'
          end
        end
    end
  end
end
