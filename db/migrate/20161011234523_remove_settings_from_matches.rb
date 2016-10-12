class RemoveSettingsFromMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :map
    remove_column :matches, :game_type

  end
end
