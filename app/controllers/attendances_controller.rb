class AttendancesController < ApplicationController
  def create
    attendance = Attendance.new(attendance_params)

    day = attendance.day
    student = attendance.student

    unless day.has_student?(student)
      attendance.save
    end

    redirect_to day
  end

  def destroy
    day = Day.find(params[:day_id])
    Attendance.find(params[:id]).destroy

    redirect_to day
  end

  def show
    @attendance = Attendance.find(params[:id])
    @flight = Flight.new(attendance: @attendance)
  end

  private

  def attendance_params
    params.require(:attendance).permit(:day_id, :student_id, :glider_id)
  end
end
