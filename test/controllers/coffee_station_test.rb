require "test_helper"

class CoffeeStationTest < ActiveSupport::TestCase
    fixtures :coffee_stations, :reports
    test "should get index" do
        get reports_path
        assert_select ".coffee_stations", 2
        assert_response :success
    end

    test "should select coffee stations" do
        @coffee_station = coffee_stations(:'3rd_floor')
        post select_coffee_stations_path, params: { place: @coffee_station.id }
        assert_redirected_to reports_path(@coffee_station.id)
    end
end
