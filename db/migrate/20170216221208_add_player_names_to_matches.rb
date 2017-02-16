class AddPlayerNamesToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :acpt_player_names, :text
    add_column :matches, :chlg_player_names, :text

  end
end
