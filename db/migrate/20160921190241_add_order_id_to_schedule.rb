class AddOrderIdToSchedule < ActiveRecord::Migration[5.0]
  def up
    add_column :schedules, :order, :integer, default: 0

    Route.all.each do |r|
      r.schedules.each do |s|
        # binding.pry
        s.order = r.schedules.maximum(:order) + 1 
        s.save!
      end
    end
  end

  def down
    remove_column :schedules, :order
  end
end
