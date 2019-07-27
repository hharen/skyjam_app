class GlidersController < ApplicationController
  def index
    @gliders = Glider.all
  end

  def new
    @glider = Glider.new
  end

  def create
    Glider.create(glider_params)

    redirect_to action: :index
  end

  def destroy
    glider = Glider.find(params[:id])
    if glider.attendances.any?
      flash[:error_glider_in_use] = "You can't delete this glider. It was already used during the school day.
      If you want to delete it please delete also the attendances."
    else
      glider.destroy
    end
    redirect_to action: :index
  end

  def edit
    @glider = Glider.find(params[:id])
  end

  def update
    Glider.find(params[:id]).update(glider_params)

    redirect_to action: :index
  end

  def show
    @glider = Glider.find(params[:id])
  end

  private

  def glider_params
    params.require(:glider).permit(:glider_type, :size, :manufacturer, :image, :color,
      :serial_number, :year_manufactured, :student_id, :color_background, :color_arc, :color_oval)
  end
end
