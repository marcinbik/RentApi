class CreateCompanyCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :company_customers do |t|
      t.references :company, foreign_key: true
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
