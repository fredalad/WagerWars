class MessageTeamId < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :team_id, :integer

  end
end
