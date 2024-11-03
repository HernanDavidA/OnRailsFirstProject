class AddCoffeeStationToReports < ActiveRecord::Migration[7.2]
  def change
    add_reference :reports, :coffee_station, null: false, foreign_key: true
  end
end
