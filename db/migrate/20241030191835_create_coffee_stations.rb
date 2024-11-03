class CreateCoffeeStations < ActiveRecord::Migration[7.2]
  def change
    create_table :coffee_stations do |t|
      t.string :place
      t.text :description

      t.timestamps
    end
  end
end
