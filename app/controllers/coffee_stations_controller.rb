class CoffeeStationsController < ApplicationController
    def index
      @coffee_stations = CoffeeStation.all
    end

    def select
      @selected_station_id = params[:place]
      @selected_station = CoffeeStation.find_by(id: @selected_station_id)

      if @selected_station
        redirect_to coffee_station_path(@selected_station)
      else
        redirect_to coffee_stations_path, alert: "No encontro ninguna estación de café"
      end
    end

    def show
      @coffee_station = CoffeeStation.find(params[:id])
      @reports = @coffee_station.reports
    end

    def create_report
      @coffee_station = CoffeeStation.find(params[:id])
      latest_report = @coffee_station.reports.order(created_at: :desc).first

      if latest_report && latest_report.status != "done"
        # Determina el siguiente estado del reporte
        next_status = case latest_report.status
        when "new_report"
                        @coffee_station.update(status: "empty") # Cambia el estado de la estación de café a "empty"
                        "pending"
        when "pending"
                        "in_progress"
        when "in_progress"
                        @coffee_station.update(status: "ready") # Cambia el estado de la estación de café a "ready"
                        "done"
        else
                        nil # Manejo en caso de un estado inesperado
        end

        # Solo actualiza si `next_status` es válido
        if next_status
          latest_report.update(status: next_status)
          flash[:notice] = "Report status updated to #{next_status}."
        else
          flash[:alert] = "Invalid report status encountered."
        end

      else
        # Crea un nuevo reporte cuando el último llega a "done" o no existe reporte
        @report = @coffee_station.reports.create(status: "new_report")
        flash[:notice] = "New report created successfully."
      end

      redirect_to coffee_station_path(@coffee_station)
    end
end
 private
    def update_report_status(report)
        report.update(status: "pending")
        report.update(status: "in_progress")
        report.update(status: "done")
    end
