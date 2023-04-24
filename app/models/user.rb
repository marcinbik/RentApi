class User < ApplicationRecord
  enum type: [:worker, :boss, :not_set]
  has_many :company_users
  has_many :companies, through: :company_users
  has_many :rents
end
