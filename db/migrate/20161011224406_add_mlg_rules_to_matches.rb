class AddMlgRulesToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :mlg_rules, :boolean
  end
end
