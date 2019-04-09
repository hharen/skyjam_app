class Flight < ApplicationRecord
  belongs_to :student
  belongs_to :day
end
