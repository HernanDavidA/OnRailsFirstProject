class ReportsController < ApplicationController
  def create
    @report = Report.new(report_params)
    @report.coffee_station = @coffee_station

    if @report.save
      redirect_to coffee_station_reports_path(@coffee_station), notice: "Report created successfully"
    else
      flash[:error] = "Error creating report."
      redirect_to coffee_station_path(@coffee_station)
    end
  end

  def update
    @report = Report.find(params[:id])

    if @report.update(report_params)
      redirect_to coffee_station_reports_path(@report.coffee_station), notice: "Report updated successfully."
    else
      flash[:error] = "Error updating report."
      redirect_to coffee_station_reports_path(@report.coffee_station)
    end
  end

  private

  def report_params
    params.require(:report).permit(:status)
  end
end
