class Customer < ApplicationRecord
  enum status: [:rent, :not_loaned, :baned, :not_set]  
  belongs_to :company
  has_many :rent
end
