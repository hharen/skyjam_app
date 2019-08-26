class Flight < ApplicationRecord

  MANOUVRES = [
    'Erste Höhenflug',
    'Genussflug',
    'Kreise',
    'Steuern mit Gewichtsverlagerung und Kurven',
    'Positiv / Negativ steuern',
    'Dynamische Halbkreise',
    'Ohren',
    'Seitenklapper',
    'PP1',
    'PP2',

    'Rollen/Wingover',
    'Ohren im Endanflug',
    'Beschleuniger',
    'Ohren mit Beschleuniger',

    'Touch & Go',
    'Landevolte',
    'Ziellandung',

    'Hangflug',
    'Thermikflug',
    'Spiralansatz',
    'B-Stall',
    'Frontklapper'
  ]

  belongs_to :attendance

  def manoeuvres_array
    return [] unless manoeuvres

    manoeuvres.split(', ')
  end

  def manoeuvres_array=(array)
    self.manoeuvres = array.reject(&:blank?).join(', ')
  end
end
