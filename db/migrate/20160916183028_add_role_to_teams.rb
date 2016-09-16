class AddRoleToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :role, :string
  end
end
