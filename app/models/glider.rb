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
  mount_uploader :image, PictureUploader

  def name
    "#{glider_type} #{size} | #{manufacturer} | #{color}"
  end

  def background_color
  end

  def arc_color
  end

  def oval_color
  end
end
