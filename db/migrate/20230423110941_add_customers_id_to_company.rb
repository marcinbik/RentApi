class AddCustomersIdToCompany < ActiveRecord::Migration[7.0]
  def change
    add_reference :companies, :customers, null: true, foreign_key: true
  end
end
