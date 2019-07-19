class Flight < ApplicationRecord
  MANOUVRES = ['Ears', 'Collapse', 'Eight']

  belongs_to :attendance
  # belongs_to :student, through: :attendance
  # belongs_to :day, through: :attendance

  def manoeuvres_array
    return [] unless manoeuvres
    
    manoeuvres.split(', ')
  end

  def manoeuvres_array=(array)
    self.manoeuvres = array.reject(&:blank?).join(', ')
  end
end
