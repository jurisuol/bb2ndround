class Client < ActiveRecord::Base
  has_many  :invoices

  validates :company_number, uniqueness: true
end
