class RemoveColumnsFromMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :time_zone
    remove_column :matches, :post_expire_time
  end
end
