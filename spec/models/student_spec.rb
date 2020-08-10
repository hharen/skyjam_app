require 'rails_helper'

RSpec.describe Student, type: :model do

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
end
