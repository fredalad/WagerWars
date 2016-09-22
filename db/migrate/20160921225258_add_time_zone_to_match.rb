class AddTimeZoneToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :time_zone, :string
  end
end
