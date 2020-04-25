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
    day = Day.find(params[:id])

    if day.attendances.any?
      flash[:error_day_has_attendances] = "You can't delete this day. There are students attending it.
      If you want to delete it, please delete also the attendances."
    else
      day.destroy!
    end

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
    @students_without_attendance = @day.students_without_attendance
    @gliders = Glider.student_gliders + Glider.school_gliders
  end

  private

  def day_params
    params.require(:day).permit(:date, :instructor, :assistant, :takeoff)
  end
end
