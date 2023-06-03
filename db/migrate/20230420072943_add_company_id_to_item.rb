class AddCompanyIdToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :company, null: true, foreign_key: true
  end
end
