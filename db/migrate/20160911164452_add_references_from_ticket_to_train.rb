class AddReferencesFromTicketToTrain < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :tickets, :train
    add_belongs_to :tickets, :begin_station, foreign_key: {to_table: :railway_stations}
    add_belongs_to :tickets, :end_station, foreign_key: {to_table: :railway_stations}
  end
end
