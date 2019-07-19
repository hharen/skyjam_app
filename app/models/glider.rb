class Glider < ApplicationRecord
  belongs_to :student, optional: true
  has_many :attendances
  mount_uploader :image, PictureUploader


  def name
    "#{glider_type} #{size} | #{manufacturer} | #{color}"
  end

end
