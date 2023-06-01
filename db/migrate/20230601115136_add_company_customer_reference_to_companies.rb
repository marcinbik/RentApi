class AddCompanyCustomerReferenceToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_reference :companies, :company_customer, null: false, foreign_key: true
  end
end
