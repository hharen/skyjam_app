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
    if manufacturer.nil?
      "#{glider_type} #{size}".strip
    elsif size.nil?
      "#{glider_type} | #{manufacturer}"
    else
      "#{glider_type} #{size} | #{manufacturer}"
    end
  end

  def self.all_sorted_by_student_first_name
    all.sort_by { |glider| glider.student&.first_name || '' }
  end

  def text_color?
    color.present?
  end

  def self.student_gliders
    where.not(student: nil)
  end

  def self.school_gliders
    where(student: nil)
  end
end
