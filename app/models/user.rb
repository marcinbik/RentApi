class User < ApplicationRecord
  enum role: [:worker, :boss, :not_set]
  has_many :company_users
  has_many :companies, through: :company_users
  has_many :rents

  PHONE_REGEX = /\A\+\d{1,4}\d{9,16}\z/
  PASSWD_REGEX = /\A^.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$\z/

  validates :email, presence: true
  validates :phone, presence: true, format: { with: PHONE_REGEX }
  validates :role, presence: true, inclusion: { in: roles.keys }
  validates :passwd, presence: true, format: { with: PASSWD_REGEX }

end
