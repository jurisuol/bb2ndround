class Category < ActiveRecord::Base
  has_many  :invoices

  validates :name, uniqueness: true
end
