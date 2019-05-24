class CreateGuestInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_informations do |t|
      t.references :user, foreign_key: true
      t.date :birth_date
      t.string :passport_number
      t.string :nationality, default: ""
      t.string :mobile_number
      t.string :charter_yatch
      t.date :arrival_date
      t.date :departure_date
      t.integer :number_of_guests, default: 1
      t.string :flight_number, default: ""
      t.boolean :collecting_at_airport, default: false
      t.boolean :in_hotel, default: false
      t.string :hotel_name, default: ""
      t.boolean :completed, default: false
      t.boolean :visible, default: false
      t.timestamps
    end
  end
end
