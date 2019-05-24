class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.references :booking, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
