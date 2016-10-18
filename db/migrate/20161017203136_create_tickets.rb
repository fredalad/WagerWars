class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :match_id
      t.string :chlg_team_name
      t.integer :chlg_team_id
      t.string :acpt_team_name
      t.integer :acpt_team_id
      t.integer :match_id

      t.timestamps
    end
  end
end
