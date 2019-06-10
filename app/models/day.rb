class Day < ApplicationRecord
  has_many :attendances
  has_many :students, through: :attendances
end
