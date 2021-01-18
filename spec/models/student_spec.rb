require 'rails_helper'

RSpec.describe Student, type: :model do
  fixtures :students

  describe '#name' do

    context "doesn't have a middle name" do
      subject(:student) { Student.new(first_name: 'Ferdinand', last_name: 'Niedermann') }

      it 'returns "Ferdinand Niedermann"' do
        expect(student.name).to eq('Ferdinand Niedermann')
      end
    end

    context 'does have a middle name' do
      subject(:student) { Student.new(first_name: 'Thomas', middle_name: 'Medard', last_name: 'Ritter') }

      it 'returns "Thomas Medard Ritter"' do
        expect(student.name).to eq('Thomas Medard Ritter')
      end
    end
  end

  describe '#has_ch_licence' do
    subject(:student) {students(:patrik)}

    context 'has ch licence' do
      it 'returns true' do
        expect(student.has_ch_licence?).to eq(true)
      end
    end

    context 'has no licence' do
      it 'returns false' do
        student.licences = []

        expect(student.has_ch_licence?).to eq(false)
      end
    end

    context 'has sk licence' do
      it 'returns false' do
        student.licences.first.update(country: 'sk')

        expect(student.has_ch_licence?).to eq(false)
      end
    end
  end
end
