class RemoveCustomerReferenceFromCompanies < ActiveRecord::Migration[7.0]
  def change
    remove_reference :companies, :customers, null: false, foreign_key: true
  end
end
