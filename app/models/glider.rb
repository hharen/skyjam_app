class Glider < ApplicationRecord
  belongs_to :student, optional: true
  has_many :attendances


  def name
    "#{glider_type} + #{size} | #{manufacturer}"
  end

end
