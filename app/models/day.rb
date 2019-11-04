class Day < ApplicationRecord
  has_many :attendances
  has_many :students, through: :attendances
  has_many :flights, through: :attendance

  def has_student?(student)
    students.include? student
  end

  def students_without_attendance
    Student.all - students
  end

  def next
    self.class.where("date > ?", date).first
  end

  def previous
    self.class.where("date < ?", date).last
  end

end
