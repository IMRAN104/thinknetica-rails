class AddPassengerInfoIntoTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :name, :string
    add_column :tickets, :surname, :string
    add_column :tickets, :passport, :string
  end
end
