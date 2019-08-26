class AdditionalFlightsController < ApplicationController
  def create
    additional_flight = AdditionalFlight.new(additional_flight_params)
    additional_flight.save!

    student = additional_flight.student

    redirect_to [student]
  end

  def new
    @student = Student.find(params[:student_id])
    @additional_flight = AdditionalFlight.new(student: @student)
  end

  def destroy
    additional_flight = AdditionalFlight.find(params[:id])
    additional_flight.destroy

    redirect_to [student]
  end

  def edit
    @additional_flight = AdditionalFlight.find(params[:id])
  end

  private

  def additional_flight_params
    params.require(:additional_flight).permit(:student_id, :date, :number_of_additional_flights)
  end
end
