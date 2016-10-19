class RenameDestinationFieldsInMessages < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :desination_username, :destination_username
    rename_column :messages, :desination_user_id, :destination_user_id

  end
end
