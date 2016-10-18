class AddTicketIdToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :ticket_id, :integer
  end
end
