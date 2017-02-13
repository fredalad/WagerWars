class AddMaxPlayerCountToLadders < ActiveRecord::Migration[5.0]
  def change
    add_column :ladders, :min_player_count, :integer
    add_column :ladders, :max_player_count, :integer
  end
end
