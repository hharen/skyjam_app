require 'rails_helper'

RSpec.describe Day, type: :model do
  fixtures :days, :students, :attendances

  describe '#has_student?' do # # for an instance method, . for a class method
    context 'day has this student' do
      let(:student) { Student.new } # why we didn't use fixture here??? like :student1

      subject(:day) do
        Day.new(students: [student])
      end

      it 'returns true' do
        expect(subject.has_student?(student)).to be true
      end
    end

    context 'day doesnt have this student' do
      let(:student1) { Student.new }
      let(:student2) { Student.new }

      subject(:day) do
        Day.new(students: [student1])
      end

      it 'returns false' do
        expect(day.has_student?(student2)).to be false
      end
    end
  end

  describe '#students_without_attendance' do
    context 'day has no attendances' do
      subject(:day) do
        Day.new
      end

      it 'returns all students' do
        expect(day.students_without_attendance).to eq(Student.all)
      end
    end

    context 'day has attendances' do
      subject(:day) do
        days(:day1)
      end

      it 'returns students which did not attend the day' do
        expect(day.students_without_attendance).to eq(students(:patrik, :kaspar))
      end
    end
  end

  describe '#next' do
    context 'a day that has a next day' do
      subject(:day) do
        days(:day2)
      end

      it 'returns the chronologically next day' do
        expect(day.next).to eq(days(:day3))
      end
    end

    context 'the last day' do
      subject(:day) do
        days(:day3)
      end

      it 'returns nil' do
        expect(day.next).to eq(nil)
      end
    end
  end

  describe '#previous' do
    context 'a day that has previous day' do
      subject(:day) do
        days(:day2) # find out what days does
      end

      it 'it returns chronologically previous day' do
        expect(day.previous).to eq(days(:day1))
      end
    end

    context 'the first day' do
      subject(:day) do
        days(:day1)
      end

      it 'returns nil' do
        expect(day.previous).to eq(nil)
      end
    end
  end

end
