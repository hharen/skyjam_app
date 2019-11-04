class FlightsController < ApplicationController
  def create
    flight = Flight.new(flight_params)
    flight.save!

    attendance = flight.attendance

    redirect_to [attendance.day, attendance]
  end

  def destroy
    flight = Flight.find(params[:id])
    attendance = flight.attendance
    flight.destroy

    redirect_to [attendance.day, attendance]
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def update
    flight = Flight.find(params[:id])
    attendance = flight.attendance
    flight.update(flight_params)

    redirect_to [attendance.day, attendance]
  end



  private

  def flight_params
    params.require(:flight).permit(:attendance_id, :notes, manoeuvres_array: [])
  end
end
