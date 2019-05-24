class CreateGuestPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_preferences do |t|
      t.references :user, foreign_key: true
      t.integer :shoe_size
      t.integer :height
      t.integer :weight
      t.text :character
      t.text :specific_request
      t.text :interest
      t.text :medical_details
      t.text :food_preference
      t.text :beverage_preference
      t.text :alcohol_preference
      t.text :wine
      t.boolean :flower, default: false
      t.boolean :newspaper, default: false
      t.string :newspaper_type
      t.timestamps
    end
  end
end
