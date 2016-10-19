class AddFieldsToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :ladder_match, :boolean
    add_column :matches, :tournament_match, :boolean
    add_column :matches, :tournament_id, :integer
    add_column :matches, :next_match_id, :integer

  end
end
