class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.datetime :when
      t.datetime :when_return
      t.datetime :declare_return
      t.integer :rent_status
      t.integer :rent_type
      t.monetize :price_hours 
      t.monetize :price_minute 
      t.monetize :price_day 
      t.monetize :deposit 
      t.monetize :sumary_cost
      t.text :note

      t.timestamps
    end
  end
end
