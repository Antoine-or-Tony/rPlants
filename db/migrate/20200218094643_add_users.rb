class AddUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :user, index: true
    add_reference :plants, :user, index: true
    add_foreign_key :plants, :users
    add_foreign_key :bookings, :users
  end
end
