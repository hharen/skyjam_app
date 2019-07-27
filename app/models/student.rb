class Student < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :gliders, dependent: :destroy
  has_many :flights, through: :attendance

  def name
    [first_name, middle_name, last_name
    ].reject(&:blank?).join(' ')
  end

  def total_flights
    all_flights = []
    self.attendances.each do |attendance|
         all_flights << attendance.flights.count
      end
    self.additional_flights + all_flights.sum
  end

  def count_attendances
    self.attendances.count
  end

end
