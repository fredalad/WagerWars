class AddMatchPlayerCountToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :min_player_count, :integer
    add_column :teams, :max_player_count, :integer
  end
end
