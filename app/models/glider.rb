class Glider < ApplicationRecord

  belongs_to :student, optional: true
  has_many :attendances
  mount_uploader :image, PictureUploader


  def name
    "#{glider_type} #{size} | #{manufacturer} | #{color}"
  end

  def self.all_sorted_by_student_first_name
    all.sort_by { |glider| glider.student&.first_name || '' }
  end

end
