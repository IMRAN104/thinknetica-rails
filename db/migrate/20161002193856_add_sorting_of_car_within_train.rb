class AddSortingOfCarWithinTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :descending, :boolean, default: false
  end
end
