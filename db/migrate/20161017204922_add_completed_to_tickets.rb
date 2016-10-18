class AddCompletedToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :completed, :boolean
  end
end
