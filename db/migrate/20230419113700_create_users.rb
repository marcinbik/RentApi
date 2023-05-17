class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
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
      t.integer :role
      t.string :personal_number
      t.string :passwd
      t.text :note

      t.timestamps
    end
  end
end
