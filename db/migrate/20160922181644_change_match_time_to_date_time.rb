class ChangeMatchTimeToDateTime < ActiveRecord::Migration[5.0]
  def change
    change_column :matches, :match_time, :datetime
  end
end
