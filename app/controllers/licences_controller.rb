class LicencesController < ApplicationController

  def new
    @licence = Licence.new
  end

  def create
    licence = Licence.new(licence_params)
    licence.save!

    [redirect_to licence.student]
  end

  def destroy
    licence = Licence.find(params[:id])
    licence.destroy

    [redirect_to licence.student]
  end

  def edit
    @licence = Licence.find(params[:id])
  end

  def update
    licence = Licence.find(params[:id])
    student = licence.student
    licence.update(licence_params)

    [redirect_to licence.student]
  end

  def licence_params
    params.require(:licence).permit(:student_id, :acquired_on, :expires_on,
      :country, :licence_type)
  end
end
