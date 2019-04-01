class Days::StudentsController < ApplicationController
  before_action :set_day

  # GET /students
  # GET /students.json
  def index
    @students = @day.students
  end


  # GET /days/:day_id/students/new
  def new

  end


  def create
    @student = Student.find(params[:student_id])
    @day.students << @student
    @day.save
  end


  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @day.students.destroy(@student)
    respond_to do |format|
      format.html { redirect_to day_students_url, notice: 'Student was successfully removed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:day_id])
    end
  end
