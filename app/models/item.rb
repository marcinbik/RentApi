class Item < ApplicationRecord
  enum status: [:rent, :ready_to_rent, :servis, :demaged, :not_set]
  belongs_to :company
  has_many :rents
end
