class DaysController < ApplicationController
  def index
    @days = Day.all
  end

  def new
    @day = Day.new
  end

  def create
    Day.create(day_params)

    redirect_to action: :index
  end

  def destroy
    Day.find(params[:id]).destroy

    redirect_to action: :index
  end

  def edit
    @day = Day.find(params[:id])
  end

  def update
    Day.find(params[:id]).update(day_params)

    redirect_to action: :index
  end

  def show
    @day = Day.find(params[:id])
    @attendance = Attendance.new(day: @day)
    @attendances = @day.attendances.sort_by { |attendance| attendance.student.first_name  }
    @students_without_attendance = @day.students_without_attendance
    @gliders = Glider.student_gliders + Glider.school_gliders
  end

  private

  def day_params
    params.require(:day).permit(:date, :instructor, :assistant, :takeoff)
  end
end
