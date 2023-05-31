class Company < ApplicationRecord
  enum status: [:work, :not_work, :stoped, :not_set]
  has_many :company_users
  has_many :users, through: :company_users
  has_many :rents
  has_many :items
  has_many :customers
end
