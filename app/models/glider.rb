class Glider < ApplicationRecord
  COLORS = [
    'black',
    'silver',
    'blue',
    'red',
    'orange',
    'gold',
    'white'
  ]

  belongs_to :student, optional: true
  has_many :attendances

  def name
    "#{glider_type} #{size} | #{manufacturer}"
  end

  def self.all_sorted_by_student_first_name
    all.sort_by { |glider| glider.student&.first_name || '' }
  end

  def text_color?
    color.present?
  end
end
