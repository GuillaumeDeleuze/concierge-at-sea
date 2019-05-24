class CreateYatches < ActiveRecord::Migration[5.2]
  def change
    create_table :yatches do |t|
      t.string :yatch_name
      t.string :photo
      t.string :room
      t.string :localisation
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
