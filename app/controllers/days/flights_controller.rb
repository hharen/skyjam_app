class Days::FlightsController < ApplicationController
  before_action :set_student, :set_day, :set_fligths

  # GET /days/:day_id/students/:student_id/flights
  def index

  end


  # GET /days/:day_id/students/:student_id/flights
  def update_all

  end

  # PATCH/PUT /days/:day_id/students/:student_id/flights
  def create_many
    @flight = Flight.find(params[:student_id])
    @day.students << @student
    @day.save
  end

  # DELETE /days/:day_id/students/:student_id/flights
  def destroy_many
    @flight = Flight.find(params[:id])
    @day.students.destroy(@flight)
    respond_to do |format|
      format.html { redirect_to day_students_url, notice: 'Flights were successfully removed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:day_id])
    end

    def set_student
      @day = Student.find(params[:student_id])
    end

    def set_fligths
      @flights = Flight.find_by(:student_id => params[:student_id], :day_id => params[:day_id])
    end
  end
