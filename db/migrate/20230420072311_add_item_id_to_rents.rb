class AddItemIdToRents < ActiveRecord::Migration[7.0]
  def change
    add_reference :rents, :item, null: true, foreign_key: true
  end
end
