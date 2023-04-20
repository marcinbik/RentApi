class Item < ApplicationRecord
  belongs_to :company
  has_many :rents
end
