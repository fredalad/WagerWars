class AddPrizeToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :case_prize, :decimal, :precision => 8, :scale => 2
  end
end
