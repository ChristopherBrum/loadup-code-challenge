class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :animal_name, null: false
      t.string :animal_type, null: false
      t.integer :hours_requested, null: false, default: 2
      t.datetime :date_of_service, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
