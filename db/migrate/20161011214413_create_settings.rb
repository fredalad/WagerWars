class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.integer :ladder_id
      t.boolean :mlg_rules
      t.string :map_name
      t.string :game_type

      t.timestamps
    end
  end
end
