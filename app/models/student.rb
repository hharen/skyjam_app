class Student < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :gliders, dependent: :destroy
  has_many :flights, through: :attendance

  def name
    [
      first_name, middle_name, last_name
    ].reject(&:blank?).join(' ')
  end
end
