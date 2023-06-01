class AddCompanyCustomerReferenceToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_reference :customers, :company_customer, null: false, foreign_key: true
  end
end
