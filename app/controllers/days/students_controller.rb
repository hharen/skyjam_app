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
    @day.students.new(@student)
  end


  # DELETE /students/1
  # DELETE /students/1.json
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:day_id])
    end
  end
