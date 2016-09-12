class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :source_user_id
      t.integer :desination_user_id
      t.string :source_username
      t.string :desination_username
      t.string :subject
      t.text :body
      t.timestamps
    end
  end
end
