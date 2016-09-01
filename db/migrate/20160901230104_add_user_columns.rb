class AddUserColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :team_count, :integer
    add_column :users, :username, :string
    add_column :users, :xbox_gt, :string
    add_column :users, :ps4_gt, :string
    add_column :users, :lol_summoner_name, :string
  end
end
