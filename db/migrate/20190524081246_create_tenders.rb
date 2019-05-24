class CreateTenders < ActiveRecord::Migration[5.2]
  def change
    create_table :tenders do |t|
      t.references :yatch, foreign_key: true
      t.datetime :time
      t.integer :called, default: 0

      t.timestamps
    end
  end
end
