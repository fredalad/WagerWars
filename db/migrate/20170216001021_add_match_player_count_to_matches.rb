class AddMatchPlayerCountToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :match_player_count, :integer
  end
end
