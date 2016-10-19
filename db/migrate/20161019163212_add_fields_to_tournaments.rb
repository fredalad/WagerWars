class AddFieldsToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :team_count, :integer
    add_column :tournaments, :game_name, :string
    add_column :tournaments, :game_id, :integer

  end
end
