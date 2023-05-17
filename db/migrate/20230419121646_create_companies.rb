class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :addres
      t.string :nip
      t.integer :company_type
      t.string :phone
      t.text :note

      t.timestamps
    end
  end
end
