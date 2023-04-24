class Company < ApplicationRecord
  enum status: [:run, :not_run, :stoped, :not_set]
  has_many :company_users
  has_many :users, through: :company_users
  has_many :rents
  has_many :item
end
