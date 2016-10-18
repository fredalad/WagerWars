class AddDisputeReportToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :acpt_team_dispute_reported, :boolean
    add_column :matches, :chlg_team_dispute_reported, :boolean

  end
end
