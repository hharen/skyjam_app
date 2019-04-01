class DaysStudent < ApplicationRecord
  belongs_to :day
  belongs_to :student
end
