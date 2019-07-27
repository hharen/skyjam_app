class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    Student.create(student_params)

    redirect_to action: :index
  end

  def destroy
    student = Student.find(params[:id])

    if student.attendances.any?
      flash[:error_student_in_use] = "You can't delete this student. She or he already attended a school day.
      If you want to delete the student, please delete also the attendances."
    else
      student.destroy
    end

    redirect_to action: :index
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    Student.find(params[:id]).update(student_params)

    redirect_to action: :index
  end

  def show
    @student = Student.find(params[:id])
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :middle_name, :additional_flights, :shv_number, :radio)
  end
end
