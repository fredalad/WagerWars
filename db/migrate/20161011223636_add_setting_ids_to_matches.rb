class AddSettingIdsToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :setting_id, :text
  end
end
