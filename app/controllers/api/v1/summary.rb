module API
  module V1
    class Summary < Grape::API
      version 'v1'
      format :json
        resource :summary do
          desc 'Return list of invoices'
          get 'months' do
            result = Invoice.months_summary
            present result, with: Entities::Months, root: 'summary'
          end
          get 'categories' do
            result = Invoice.categories_summary
            present result, with: Entities::Categories, root: 'summary'
          end
        end
    end
  end
end
