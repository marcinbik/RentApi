class Customer < ApplicationRecord
  enum status: [:rent, :not_loaned, :baned, :not_set]  
  belongs_to :company_customer
  has_many :companies, through: :company_customers
  has_many :rent
end
