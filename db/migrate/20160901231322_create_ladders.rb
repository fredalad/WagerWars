class CreateLadders < ActiveRecord::Migration[5.0]
  def change
    create_table :ladders do |t|
      t.string :name
      t.integer :game_id
      t.integer :match_player_count

      t.timestamps
    end
  end
end
