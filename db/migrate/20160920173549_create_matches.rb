class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :ladder_id
      t.integer :chlg_team_id
      t.string :chlg_team_name
      t.boolean :chlg_team_reported
      t.integer :chlg_team_wins
      t.integer :chlg_team_losses
      t.integer :acpt_team_id
      t.string :acpt_team_name
      t.boolean :acpt_team_reported
      t.integer :acpt_team_wins
      t.integer :acpt_team_losses
      t.boolean :challange
      t.boolean :completed
      t.boolean :disputed
      t.datetime :match_time
      t.datetime :post_expire_time
      t.boolean :expired

      t.timestamps
    end
  end
end
