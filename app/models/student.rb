class Student < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :gliders, dependent: :destroy
  has_many :flights, through: :attendances
  has_many :additional_flights

  def name
    [first_name, middle_name, last_name].reject(&:blank?).join(' ')
  end

  def total_flights_until_today(today_attendance)
    today = today_attendance.day.date
    all_flights = []
    self.attendances.each do |attendance|
      if attendance.day.date < today
       all_flights << attendance.flights.count
      end
    end
    self.additional_flights.count + all_flights.sum
  end

  def total_flights
    flight_count = self.flights.count
    additional_flight_count = self.additional_flights.count

    flight_count + additional_flight_count
  end

  def all_flights
    all_flights = []
    all_flights += self.flights
    all_flights += self.additional_flights
    all_flights.sort_by(&:date) #stands for { |flight| flight.date}
  end

  def count_attendances
    self.attendances.count
  end

end
