class AddCustomersIdToRents < ActiveRecord::Migration[7.0]
  def change
    add_reference :rents, :customers, null: true, foreign_key: true
  end
end
