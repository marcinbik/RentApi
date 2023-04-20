class AddUserIdToRents < ActiveRecord::Migration[7.0]
  def change
    add_reference :rents, :user, null: false, foreign_key: true
  end
end
