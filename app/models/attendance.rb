class Attendance < ApplicationRecord
  belongs_to :day
  belongs_to :student
  belongs_to :glider
  has_many :flights, dependent: :destroy
end
