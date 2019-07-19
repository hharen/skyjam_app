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
    Student.find(params[:id]).destroy

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
