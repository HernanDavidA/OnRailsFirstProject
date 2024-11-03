class AddStatusToCoffeeStation < ActiveRecord::Migration[7.2]
  def change
    add_column :coffee_stations, :status, :string
  end
end
