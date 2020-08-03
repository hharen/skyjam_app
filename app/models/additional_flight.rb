class AdditionalFlight < ApplicationRecord
  belongs_to :student

  def number_of_additional_flights
    0
  end

  def manoeuvres
    nil
  end

end
