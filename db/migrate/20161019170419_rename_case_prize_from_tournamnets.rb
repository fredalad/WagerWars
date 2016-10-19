class RenameCasePrizeFromTournamnets < ActiveRecord::Migration[5.0]
  def change
    rename_column :tournaments, :case_prize, :cash_prize

  end
end
