class Student < ApplicationRecord
  has_many :attendances
  has_many :gliders
end
