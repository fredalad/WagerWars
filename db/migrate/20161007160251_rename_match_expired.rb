class RenameMatchExpired < ActiveRecord::Migration[5.0]
  def change
    rename_column :matches, :expired, :accepted
  end
end
