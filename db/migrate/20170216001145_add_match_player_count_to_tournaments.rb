class AddMatchPlayerCountToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :match_player_count, :integer
  end
end
