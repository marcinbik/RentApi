class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :country
      t.string :voivodeship
      t.string :city
      t.string :post_code
      t.string :phone
      t.string :company
      t.string :nip
      t.integer :customer_type
      t.string :personal_number
      t.integer :discount
      t.string :identity_card
      t.text :note

      t.timestamps
    end
  end
end
