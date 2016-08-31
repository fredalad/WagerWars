class AddAttachmentUserIconToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :user_icon
    end
  end

  def self.down
    remove_attachment :users, :user_icon
  end
end
