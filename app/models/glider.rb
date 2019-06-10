class Glider < ApplicationRecord
  belongs_to :student
  has_many :attendances
end
