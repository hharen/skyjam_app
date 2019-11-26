require 'rails_helper'

RSpec.describe Day, type: :model do
  fixtures :all

  describe '#has_student?' do # # for an instance method, . for a class method
    context 'day has student' do
      let(:student) { Student.new }

      subject(:day) do
        described_class.new(students: [student])
      end

      it 'returns true' do
        expect(subject.has_student?(student)).to be true
      end
    end

    context 'day doesnt have this student' do
      let(:student) { Student.new }
      let(:student1) { Student.new }

      subject(:day) do
        described_class.new(students: [student])
      end

      it 'returns false' do
        expect(subject.has_student?(student1)).to be false
      end
    end
  end

  describe '#students_without_attendance' do
    context 'day has no attendances' do
      subject(:day) do
        described_class.new
      end

      it 'returns all students' do
        expect(subject.students_without_attendance).to eq(Student.all)
      end
    end

    context 'day has attendances' do
      subject(:day) do
        days(:day1)
      end

      it 'returns students which did not attend the day' do
        expect(subject.students_without_attendance).to eq(students(:patrik, :kaspar))
      end
    end

  end
end
