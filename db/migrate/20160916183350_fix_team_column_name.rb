class FixTeamColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :teams, :role, :leader
  end
end
