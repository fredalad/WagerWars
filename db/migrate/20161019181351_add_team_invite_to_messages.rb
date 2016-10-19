class AddTeamInviteToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :team_invite, :boolean
  end
end
