class DropTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :teams_users
  end
end
