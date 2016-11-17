class AddUserToTicket < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :user, index: true
  end
end
