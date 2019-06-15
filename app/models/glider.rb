class Glider < ApplicationRecord
  belongs_to :student, optional: true
  has_many :attendances
end
