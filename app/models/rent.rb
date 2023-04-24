class Rent < ApplicationRecord
  enum status: [:start, :end, :reserved, :not_set]
  belongs_to :company
  belongs_to :user
  belongs_to :item
  belongs_to :customer
end
