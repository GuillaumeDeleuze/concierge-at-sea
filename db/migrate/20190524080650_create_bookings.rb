class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :yatch, foreign_key: true
      t.date :start_at
      t.date :end_at
      t.integer :rating
      t.text :captain_message

      t.timestamps
    end
  end
end
