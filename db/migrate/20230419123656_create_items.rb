class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :evidential_1
      t.string :evidential_2
      t.string :evidential_3
      t.integer :type
      t.integer :status
      t.monetize :price_hours
      t.monetize :price_minute
      t.monetize :price_day
      t.monetize :deposit 
      t.integer :use_limit
      t.text :note
      

      t.timestamps
    end
  end
end
