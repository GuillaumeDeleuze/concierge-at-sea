class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.references :menu, foreign_key: true
      t.string :name
      t.text :description
      t.integer :dish_type, default: 0

      t.timestamps
    end
  end
end
