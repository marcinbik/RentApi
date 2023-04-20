class AddCompanyIdToRents < ActiveRecord::Migration[7.0]
  def change
    add_reference :rents, :company, null: false, foreign_key: true
  end
end
