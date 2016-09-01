class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :ladder_id
      t.string :ladder_name
      t.integer :wins
      t.integer :losses
      t.integer :roster_count

      t.timestamps
    end
  end
end
