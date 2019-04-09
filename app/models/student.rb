class Student < ApplicationRecord
  has_and_belongs_to_many :days
  has_many :flights
end
