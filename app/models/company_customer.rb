class CompanyCustomer < ApplicationRecord
  belongs_to :company
  belongs_to :customer
end