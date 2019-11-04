class Flight < ApplicationRecord

  MANOUVRES = [
    'Erste Höhenflug',

    'Genussflug',
    'Hangflug',
    'Thermikflug',

    'Kreise',
    'Steuern mit Gewichtsverlagerung und Kurven',
    'Positiv / Negativ steuern',
    'Dynamische Halbkreise',
    'Ohren',
    'Seitenklapper',
    'PP1',
    'PP2',

    'Nicken',
    'Rollen/Wingover',
    'Beschleuniger',
    'Ohren mit Beschleuniger',

    'Spiralansatz',
    'B-Stall',
    'Frontklapper',

    'Touch & Go',
    'Landevolte',
    'Ohren im Endanflug',
    'Ziellandung'
  ]

  belongs_to :attendance
  has_one :day, through: :attendance

  def date
    day.date
  end

  def manoeuvres_array
    return [] unless manoeuvres

    manoeuvres.split(', ')
  end

  def manoeuvres_array=(array)
    self.manoeuvres = array.reject(&:blank?).join(', ')
  end

end
