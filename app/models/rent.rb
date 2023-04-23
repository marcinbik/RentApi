class Rent < ApplicationRecord
  belongs_to :company
  belongs_to :user
  belongs_to :item
  belongs_to :customer
end
