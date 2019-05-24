class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :crew, :boolean, default: false
    add_column :users, :guest, :boolean, default: false
    add_column :users, :role, :integer
    add_column :users, :name, :string
    add_reference :users, :booking, foreign_key: true
  end
end
