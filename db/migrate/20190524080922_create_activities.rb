class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.integer :reserved
      t.datetime :start_at
      t.references :yatch, foreign_key: true
      t.integer :number_of_guest

      t.timestamps
    end
  end
end
