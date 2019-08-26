require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  setup do
    @student = students(:thomas)
    @attendance = @student.attendances.first
    @attendance.flights.create!
    @attendance.flights.create!
    @student.additional_flights.create!(number_of_additional_flights: 1)
    @student.additional_flights.create!(number_of_additional_flights: 2)
  end

  test "count all the flights" do
    assert_equal 5, @student.total_flights
  end
end
