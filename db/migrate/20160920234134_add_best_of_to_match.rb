class AddBestOfToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :best_of, :integer
  end
end
