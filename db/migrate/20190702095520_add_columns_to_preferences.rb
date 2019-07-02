class AddColumnsToPreferences < ActiveRecord::Migration[5.2]
  def change
    add_column :guest_preferences, :allergy, :string
    add_column :guest_preferences, :dislike, :string
  end
end
