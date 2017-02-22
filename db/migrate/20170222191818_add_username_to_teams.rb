class AddUsernameToTeams < ActiveRecord::Migration[5.0]
  def change

    add_column :teams, :username, :text

  end
end
