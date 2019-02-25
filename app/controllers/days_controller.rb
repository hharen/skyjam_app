class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]

  # GET /days
  # GET /days.json
  def index
    @days = Day.all
  end

  # GET /days/1
  # GET /days/1.json
  def show
  end

  # GET /days/new
  def new
    @day = Day.new
  end

  # GET /days/1/edit
  def edit
  end

  # POST /days
  # POST /days.json
  def create
    @day = Day.new(day_params)

    respond_to do |format|
      if @day.save
        format.html { redirect_to @day, notice: 'Day was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /days/1
  # PATCH/PUT /days/1.json
  def update
    student_id_to_add = params[:day][:student_id]
    respond_to do |format|
      if @day.update(day_params)
        if @day.student_ids.any? {student_id_to_add}
        else
          @student = Student.find(student_id_to_add)
          @day.students<<@student
          # debugger
          # students = @day.students.to_a
          # students << Student.find(student_id_to_add)
          # @day.students = students.uniq
          @day.save
        end
        format.html { redirect_to @day, notice: 'Day was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /days/1
  # DELETE /days/1.json
  def destroy
    @day.destroy
    respond_to do |format|
      format.html { redirect_to days_url, notice: 'Day was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_params
      params.require(:day).permit(:date, :instructor, :assistant, :takeoff)
    end
end
