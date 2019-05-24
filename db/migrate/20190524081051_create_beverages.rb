class CreateBeverages < ActiveRecord::Migration[5.2]
  def change
    create_table :beverages do |t|
      t.string :name
      t.string :description
      t.integer :quantity, default: 0
      t.integer :beverage_type, default: 0
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
