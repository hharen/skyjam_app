class GlidersController < ApplicationController
  before_action :set_glider, only: [:show, :edit, :update, :destroy]

  # GET /gliders
  # GET /gliders.json
  def index
    @gliders = Glider.all
  end

  # GET /gliders/1
  # GET /gliders/1.json
  def show
  end

  # GET /gliders/new
  def new
    @glider = Glider.new
  end

  # GET /gliders/1/edit
  def edit
  end

  # POST /gliders
  # POST /gliders.json
  def create
    @glider = Glider.new(glider_params)

    respond_to do |format|
      if @glider.save
        format.html { redirect_to @glider, notice: 'Glider was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /gliders/1
  # PATCH/PUT /gliders/1.json
  def update
    respond_to do |format|
      if @glider.update(glider_params)
        format.html { redirect_to @glider, notice: 'Glider was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /gliders/1
  # DELETE /gliders/1.json
  def destroy
    @glider.destroy
    respond_to do |format|
      format.html { redirect_to gliders_url, notice: 'Glider was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glider
      @glider = Glider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def glider_params
      params.require(:glider).permit(:type, :size, :manufacturer, :image, :color_name, :serial_number, :year_manufactured)
    end
end
