class AdditionalFlightsController < ApplicationController
  def create
    params[:additional_flight][:number_of_additional_flights].to_i.times do
      additional_flight = AdditionalFlight.new(additional_flight_params)
      additional_flight.save!
    end

    student = Student.find(additional_flight_params[:student_id])

    redirect_to [student]
  end

  def new
    @student = Student.find(params[:student_id])
    @additional_flight = AdditionalFlight.new(student: @student)
  end

  def destroy
    additional_flight = AdditionalFlight.find(params[:id])
    additional_flight.destroy

    redirect_to request.referrer
  end

  def edit
    @additional_flight = AdditionalFlight.find(params[:id])
  end

  private

  def additional_flight_params
    params.require(:additional_flight).permit(:student_id, :date, :notes)
  end
end
