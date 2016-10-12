class AddMoreSettingsToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :map, :text
    add_column :matches, :game_type, :text
  end
end
