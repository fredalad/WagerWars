class AddStartTimeToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :start_time, :datetime
  end
end
